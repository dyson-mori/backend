class User::ValidateController < ApplicationController
  before_action :authenticate_request!

  def validate_token
    render json: { status: 200 }, status: :ok
  rescue => e
    render json: { status: 401 }, status: :unauthorized
  end

  private

  def authenticate!
    head :unauthorized unless current_user_from_token
  end
end
