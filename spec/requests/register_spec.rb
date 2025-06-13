require 'rails_helper'

RSpec.describe 'POST /signup', type: :request do
  let(:valid_attributes) do
    {
      user: {
        name: 'Sergio',
        email: 'sergio@example.com',
        password: 'password123',
        password_confirmation: 'password123'
      }
    }
  end

  let(:invalid_attributes) do
    {
      user: {
        name: 'Sergio',
        email: 'sergio@example.com',
        password: 'password123',
        password_confirmation: 'wrong_confirmation'
      }
    }
  end

  context 'Testando a criação do usuário' do
    it 'Usuário registrado com sucesso!' do
      post '/signup', params: valid_attributes.to_json, headers: { 'Content-Type' => 'application/json' }

      expect(response).to have_http_status(:created)
      expect(JSON.parse(response.body)['message']).to eq('Usuário registrado com sucesso!')
    end
  end

  context 'Testando se o usuário já existe' do
    it 'Esse email já está em uso!' do
      post '/signup', params: valid_attributes.to_json, headers: { 'Content-Type' => 'application/json' }
      expect(response).to have_http_status(:created)

      post '/signup', params: valid_attributes.to_json, headers: { 'Content-Type' => 'application/json' }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body)['message']).to include("Algo deu de errado ao tentar criar o usuário!")
    end
  end

end