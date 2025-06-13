class ApplicationController < ActionController::API
  include ActionController::Cookies
  respond_to :json

  JWT_SECRET = Rails.application.credentials[:jwt_secret]

  def current_user_from_token
    token = cookies['porcupine-token']
    return nil if token.blank?

    begin
      decoded_token = Warden::JWTAuth::TokenDecoder.new.call(token)
      user_id = decoded_token['sub'] # `sub` é o padrão do devise-jwt
      User.find_by(id: user_id)
    rescue JWT::DecodeError, ActiveRecord::RecordNotFound
      nil
    end
  end

  def authenticate_request!
    authorize_request
  end

  def current_user
    @current_user
  end

  private

  def authorize_request
    header = request.headers['Authorization']
    token = header.split(' ').last if header

    if JWT_SECRET.nil? || JWT_SECRET.empty?
      render json: { errors: 'Erro de configuração: JWT_SECRET não definido ou vazio.' }, status: :internal_server_error
      return # Use 'return' para parar a execução do método.
    end

    begin
      if token
        decoded_token = JWT.decode(token, JWT_SECRET, true, algorithm: 'HS256')
        user_id = decoded_token[0]['sub']
        @current_user = User.find(user_id)
      else
        render json: { errors: 'Token não fornecido no cabeçalho Authorization.' }, status: :unauthorized
        return
      end
    rescue JWT::DecodeError => e
      render json: { errors: "Token JWT inválido: #{e.message}" }, status: :unauthorized
      return
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'Usuário não encontrado para o token fornecido.' }, status: :unauthorized
      return
    end
  end
end