class ApplicationController < ActionController::Base
  
  before_action :configure_permitted_parameters, if: :devise_controller?

  # サインイン後の遷移先
  def after_sign_in_path_for(resource)
    user_posts_path
  end


  # サインアウト後の遷移先
  def after_sign_out_path_for(resource)
    about_path
  end

  protected

  def configure_permitted_parameters
    # 登録に必要な情報の
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
end
