class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to categories_path, :alert => exception.message
  end

  def after_sign_in_path_for(resource_or_scope)
    categories_path
  end

  def after_sign_up_path_for(resource_or_scope)
    categories_path
  end

end
