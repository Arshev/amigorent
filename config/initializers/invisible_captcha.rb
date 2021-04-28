InvisibleCaptcha.setup do |config|
  # config.honeypots           << ['more', 'fake', 'attribute', 'names']
  # config.visual_honeypots    = false
  # config.timestamp_threshold = 4
  # config.timestamp_enabled   = true
  # config.injectable_styles   = false

  # Leave these unset if you want to use I18n (see below)
  config.sentence_for_humans     = 'Если вы человек, игнорируйте это поле'
  config.timestamp_error_message = 'Извините, это слишком быстро для человека, пожалуйста заполните форму заново.'
end
