class ApplicationController < ActionController::Base
  before_action :authenticate_api_token, if: :json_request?
  protect_from_forgery with: :exception, unless: -> { request.format.json? }

  private
  def authenticate_api_token
    token = request.headers['Authorization']
    head :unauthorized unless token == ENV['API_TOKEN']
  end

  def json_request?
    request.format.json?
  end
end
