class User::AuthController < Devise::SessionsController
  include JsonErrorResponder

  respond_to :json

  def create
    super do |resource|
      Rails.logger.info "Usuário logado: #{resource.email}" if resource.present?
    end
  end

  private

  def respond_with(resource, _opts = {})
    token = request.env['warden-jwt_auth.token']

    cookies["porcupine-token"] = {
      value: token,
      httpOnly: true,
      secure: Rails.env.production?,
      same_site: :lax,
      path: '/',
      expires: 2.minutes.from_now
    }

    if resource.persisted?
      render json: {
        message: 'Login realizado com sucesso!',
        token: token,
      }, status: :ok
    else
      json_api_error_response(422, "Unprocessable Entity", "Algo deu de errado ao tentar criar o usuário!")
    end
  end

end