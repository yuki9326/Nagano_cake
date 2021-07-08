class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys:[:last_name,:first_name,:last_name_kana,
    :first_name_kana,:postal_code,:address,:telephone_number,:is_active])
  end

def after_sign_in_path_for(resource)
  case resource
  when Admin
    admin_path
  when Customer
    root_path
  end
end

  def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
  end
end
