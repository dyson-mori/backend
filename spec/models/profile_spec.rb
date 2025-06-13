require 'rails_helper'

RSpec.describe 'GET /me', type: :request do
  context 'Testar rota /me com o token' do
    it 'usuário registrado!' do
      user = create(:user, password: 'senha_valida', password_confirmation: 'senha_valida')

      post '/login', params: {
        user: {
          email: user.email,
          password: 'senha_valida'
        }
      }

      token = response.headers['Authorization']
      expect(token).to be_present, "Token não foi retornado no login!"

      get '/me', headers: { 'Authorization' => "Bearer #{token}" }

      expect(response).to have_http_status(:ok)
      json = JSON.parse(response.body)
      expect(json['email']).to eq(user.email)
    end
  end

  context 'Testar rota /me sem o token' do
    it 'retorna 401 unauthorized!' do
      get '/me'

      expect(response).to have_http_status(:unauthorized)

      json = JSON.parse(response.body)
      expect(json['message']).to eq(nil)
    end
  end
end