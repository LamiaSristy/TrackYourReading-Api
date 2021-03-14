require 'rails_helper'

RSpec.describe 'User API', type: :request do
  let!(:users) { create_list(:user, 10) }
  let(:user_id) { users.first.id }

  describe 'GET /users' do
    before { get '/users' }

    it 'returns user' do
      expect(response).to have_http_status(:success)
      expect {
        JSON.parse(response.body)
      }.to_not raise_error
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end


  describe 'GET /users/:id' do
    before { get "/users/#{user_id}" }

    context 'when the record exists' do
    
      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the user does not exist' do
      let(:user_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find User/)
      end
    end
  end


  describe 'POST /users' do
    let(:valid_attributes) { { user: { username: 'TestUser', password: 'testuser', password_confirmation: 'testuser' } } }

    context 'when the request is valid' do
      before { post '/users', params: valid_attributes }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the request is invalid' do
      before { post '/users', params: { user: { username: 'TestUser2' } } }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Password can't be blank/)
      end
    end
  end
end
