class BaseController < ApplicationController
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :require_authentication

  def require_authentication
    authenticate_with_http_token do |token, options|
      @current_entity ||= Entity.find_by(auth_token: token)
    end

    return render json: { error: 'Unauthorized' }, status: :unauthorized if @current_entity.nil?
  end
end
