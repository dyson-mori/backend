class User::AuthController < Devise::SessionsController
  respond_to :json
  skip_before_action :verify_authenticity_token, raise: false

  def create
    self.resource = warden.authenticate!(auth_options)
    
    token = Warden::JWTAuth::UserEncoder.new.call(resource, :user, nil).first
    
    cookies["porcupine-token"] = {
      value: token,
      httpOnly: true,
      secure: Rails.env.production?,
      same_site: :lax,
      path: '/',
      expires: 2.minutes.from_now
    }

    render json: {
      message: 'Login realizado com sucesso!',
      token: token
    }, status: :ok
  end
end
