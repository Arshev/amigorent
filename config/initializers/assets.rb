# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
Rails.application.config.assets.precompile +=
  %w[
    application.js
    application.css
    call_booking.js
    admins_panel.scss
    admin.css
    ckeditor/config.js
  ]
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.paths << Rails.root.join('node_modules')
Rails.application.config.assets.precompile +=
  ['node_modules/vue-loading-overlay/dist/vue-loading.css']
Rails.application.config.assets.precompile +=
  ['node_modules/sweetalert2/dist/sweetalert2.min.css']
