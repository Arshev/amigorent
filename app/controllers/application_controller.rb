class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  helper_method :cities_list

  def after_sign_up_path_for(resource)
    if resource.is_admin?
      admin_path # <- Path you want to redirect the user to after signup
    else
      root_path
    end
  end

  def after_sign_in_path_for(resource)
    if current_user.is_admin?
      admin_path # <- Path you want to redirect the user to after signup
    else
      root_path
    end
  end

  def cities_list
    City.where(active: true)
  end

  protected

  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale = I18n.available_locales.include?(locale) ?
      locale : I18n.default_locale
  end

  # def default_url_options
  #   { locale: I18n.locale }
  # end
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :lastname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :lastname])
  end
end
