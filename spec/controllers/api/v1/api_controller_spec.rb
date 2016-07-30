require 'rails_helper'

RSpec.describe Api::V1::ApiController, type: :controller do
  let(:user_password) { 'q1w2e3r4t5' }
  let(:user)          { create(:user, password: user_password) }

  describe 'actions' do
    describe 'GET v1/auth_token' do
      context 'with valid credentials' do
        it 'returns auth_token' do
          basic_auth user.email, user_password
          get :auth_token
          expect(response).to be_success
          json = JSON.parse(response.body)
          expect(json['auth_token']).not_to be_nil
        end
      end

      context 'with unvalid credentials' do
        it 'returns errors' do
          get :auth_token
          expect(response).to be_unauthorized
          json = JSON.parse(response.body)
          expect(json['errors']['access']).not_to be_nil
        end
      end
    end
  end
end
