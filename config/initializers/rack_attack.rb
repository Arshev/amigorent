class Rack::Attack

  Rack::Attack.enabled = Rails.env.production?

  ### Configure Cache ###

  # If you don't want to use Rails.cache (Rack::Attack's default), then
  # configure it here.
  #
  # Note: The store is only used for throttling (not blocklisting and
  # safelisting). It must implement .increment and .write like
  # ActiveSupport::Cache::Store

  cache.store = ActiveSupport::Cache::MemoryStore.new

  ### Throttle Spammy Clients ###

  # If any single client IP is making tons of requests, then they're
  # probably malicious or a poorly-configured scraper. Either way, they
  # don't deserve to hog all of the app server's CPU. Cut them off!
  #
  # Note: If you're serving assets through rack, those requests may be
  # counted by rack-attack and this throttle may be activated too
  # quickly. If so, enable the condition to exclude them from tracking.

  # Always allow requests from localhost
  # (blocklist & throttles are skipped)
  safelist("allow from localhost") do |req|
    # Requests are allowed if the return value is truthy
    "127.0.0.1" == req.ip || "::1" == req.ip
  end

  # Always allow requests from localhost
  # (blocklist & throttles are skipped)
  safelist("allow from rentprog") do |req|
    # Requests are allowed if the return value is truthy
    "95.213.199.52" == req.ip
  end

  # Throttle all requests by IP (60rpm)
  #
  # Key: "rack::attack:#{Time.now.to_i/:period}:req/ip:#{req.ip}"
  throttle("req/ip", limit: 50, period: 1.minutes) do |req|
    # Rails.logger.error("Rack::Attack 1 Too many requests from IP: #{req.ip}")
    req.ip # unless req.path.start_with?('/assets')
  end

  ### Prevent Brute-Force Login Attacks ###

  # The most common brute-force login attack is a brute-force password
  # attack where an attacker simply tries a large number of emails and
  # passwords to see if any credentials match.
  #
  # Another common method of attack is to use a swarm of computers with
  # different IPs to try brute-forcing a password for a specific account.

  # Throttle POST requests to /login by IP address
  #
  # Key: "rack::attack:#{Time.now.to_i/:period}:logins/ip:#{req.ip}"
  throttle("logins/ip", limit: 5, period: 20.seconds) do |req|
    if req.path == "/login" && req.post?
      # Rails.logger.error("Rack::Attack 2 Too many POSTS from IP: #{req.ip}")
      req.ip
    end
  end

  # Lockout IP addresses that are hammering your login page.
  # After 20 requests in 1 minute, block all requests from that IP for 1 hour.
  blocklist("allow2ban login scrapers") do |req|
    # `filter` returns false value if request is to your login page (but still
    # increments the count) so request below the limit are not blocked until
    # they hit the limit.  At that point, filter will return true and block.
    Rack::Attack::Allow2Ban.filter(req.ip, maxretry: 50, findtime: 1.minute, bantime: 1.hour) do
      Rails.logger.error("Rack::Attack 3 Too many GETS from IP: #{req.ip}")
      # The count for the IP is incremented if the return value is truthy.
      req.path == "/" and req.get?
    end
  end

  # Throttle any POST requests by IP address
  #
  # Key: "rack::attack:#{Time.now.to_i/:period}:pink/posts/ip:#{req.ip}"
  throttle("pink/posts/ip", limit: 1, period: 2.seconds) do |req|
    if req.post?
      # Rails.logger.error("Rack::Attack 4 Too many POSTS from IP: #{req.ip}")
      req.ip
    end
  end

  # Block suspicious requests for '/etc/password' or wordpress specific paths.
  # After 3 blocked requests in 10 minutes, block all requests from that IP for 5 minutes.
  blocklist("fail2ban pentesters") do |req|
    # `filter` returns truthy value if request fails, or if it's from a previously banned IP
    # so the request is blocked
    Rack::Attack::Fail2Ban.filter("pentesters-#{req.ip}", maxretry: 3, findtime: 10.minutes, bantime: 30.minutes) do
      # Rails.logger.error("Rack::Attack 5 Too many POSTS from IP: #{req.ip}")
      # The count for the IP is incremented if the return value is truthy
      CGI.unescape(req.query_string) =~ %r{/etc/passwd} ||
        req.path.include?("/etc/passwd") ||
        req.path.include?("wp-admin") ||
        req.path.include?("wp-login")
    end
  end

  # Throttle POST requests to /login by email param
  #
  # Key: "rack::attack:#{Time.now.to_i/:period}:logins/email:#{normalized_email}"
  #
  # Note: This creates a problem where a malicious user could intentionally
  # throttle logins for another user and force their login requests to be
  # denied, but that's not very common and shouldn't happen to you. (Knock
  # on wood!)
  throttle("logins/email", limit: 5, period: 20.seconds) do |req|
    if req.path == "/login" && req.post?
      # Normalize the email, using the same logic as your authentication process, to
      # protect against rate limit bypasses. Return the normalized email if present, nil otherwise.
      req.params["email"].to_s.downcase.gsub(/\s+/, "").presence
    end
  end

  ActiveSupport::Notifications.subscribe("rack.attack") do |_name, _start, _finish, _request_id, payload|
    req = payload[:request]
    Rails.logger.error("Rack::Attack #{payload[:event]} #{req.ip} #{req.request_method} #{req.fullpath}")
  end

  ### Custom Throttle Response ###

  # By default, Rack::Attack returns an HTTP 429 for throttled responses,
  # which is just fine.
  #
  # If you want to return 503 so that the attacker might be fooled into
  # believing that they've successfully broken your app (or you just want to
  # customize the response), then uncomment these lines.
  # self.throttled_response = lambda do |env|
  #  [ 503,  # status
  #    {},   # headers
  #    ['']] # body
  # end
end
