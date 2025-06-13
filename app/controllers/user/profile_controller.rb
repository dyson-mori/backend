class User::ProfileController < ApplicationController
  before_action :authenticate_request!

  def index
    render json: current_user.as_json(only: [:name, :email]), status: :ok
  end
end
