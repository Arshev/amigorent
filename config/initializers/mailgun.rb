Mailgun.configure do |config|
  config.api_key = Rails.application.credentials.mailgun_secret_key
end
