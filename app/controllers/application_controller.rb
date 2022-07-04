class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?

  #rescue_from ActiveRecord::RecordNotFound, with: :render_404
  #rescue_from ActionController::RoutingError, with: :render_404

  #def render_404
    #render template: 'errors/error_404', status: 404, layout: 'application', content_type: 'text/html'
  #end

  def after_sign_in_path_for(resouece)
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys:[:email])
    end

end
