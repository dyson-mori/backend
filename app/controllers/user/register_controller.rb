class User::RegisterController < Devise::RegistrationsController
  include JsonErrorResponder

  respond_to :json
  before_action :ensure_json_request

  def create
    build_resource(sign_up_params)

    if resource.save
      render json: {
        message: 'Usuário registrado com sucesso!',
      }, status: :created
    else
      json_api_error_response(422, "Unprocessable Entity", "Algo deu de errado ao tentar criar o usuário!")
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: { message: 'Usuário registrado com sucesso!' }, status: :created
    else
      json_api_error_response(422, "Unprocessable Entity", "Algo deu de errado! - respond_with")
    end
  end

  def ensure_json_request
    request.format = :json
  end
end