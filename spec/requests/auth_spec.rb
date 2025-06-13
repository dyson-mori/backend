require 'rails_helper'

RSpec.describe 'POST /login', type: :request do
  let(:user) do
    User.create!(
      name: 'Lex',
      email: 'lex@gmail.com',
      password: '123456',
      password_confirmation: '123456'
    )
  end

  context 'Testando o login e a geração de JWT' do
    it 'login realizado com sucesso com o retorno do token' do
      post '/login', params: {
        user: {
          email: user.email,
          password: '123456'
        }
      }, as: :json

      expect(response).to have_http_status(:ok)
      expect(response.parsed_body['message']).to eq('Login realizado com sucesso!')
      expect(response.parsed_body['token']).to be_present
      expect(response.headers['Set-Cookie']).to include('porcupine-token')
    end
  end

  context 'Testando se o login não existe' do
    it 'usuário não encontrado' do
      post '/login', params: {
        user: {
          email: user.email,
          password: 'senhaerrada'
        }
      }, as: :json

      expect(response).to have_http_status(:unauthorized)
      expect(response.parsed_body['message']).to eq('Falha ao tentar realizar o login, tente novamente!')
    end
  end
end
