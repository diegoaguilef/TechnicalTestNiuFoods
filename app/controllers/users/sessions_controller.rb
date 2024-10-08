# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  protect_from_forgery with: :exception, unless: -> { request.format.json? }
  respond_to :json
  layout 'sessions'

  private

  def respond_to_on_destroy
    if current_user
      render json: { message: 'Logged out successfully' }, status: :ok
    else
      render json: { message: 'User not logged in' }, status: :unauthorized
    end
  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
