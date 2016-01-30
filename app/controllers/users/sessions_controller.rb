class Users::SessionsController < Devise::RegistrationsController
  protected

  def after_sign_in_path_for(resource)
    wod_posts_path
  end
end


