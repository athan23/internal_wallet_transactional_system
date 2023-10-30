class SessionsController < ApplicationController
  def create
    username = params[:username]

    entity = Entity.find_by(username: username)
    if entity && entity.authenticate(params[:password])
      generate_authentication_token!(entity)
      render json: { username: entity.username, token: entity.auth_token }, status: :ok
    else
      render json: { error: 'Invalid username or password' }, status: :unprocessable_entity
    end
  end

  def destroy
    entity.update!(auth_token: nil)
    @current_entity = nil
    render status: :ok
  end

  private

  def generate_authentication_token!(entity)
    entity.auth_token = loop do
      auth_token = SecureRandom.hex
      break auth_token unless Entity.exists?(auth_token: auth_token)
    end
    entity.save!
  end
end
