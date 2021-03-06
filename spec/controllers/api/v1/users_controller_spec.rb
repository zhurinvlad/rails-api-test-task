require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  let(:user_attributes) { attributes_for(:user) }

  describe 'actions' do
    it 'GET v1/users' do
      create_list(:user, 10)
      get :index
      expect(response).to be_success
      expect(json['users'].length).to eq(10)
    end

    describe 'POST v1/users' do
      before { authenticate_from_token! }

      context 'with valid attributes' do
        it 'creates a new user' do
          post :create, params: { user: user_attributes }
          expect(response).to be_created
        end
      end

      context 'with unvalid attributes' do
        it 'returns errors' do
          user_attributes[:email] = nil
          post :create, params: { user: user_attributes }

          expect(response).to have_http_status(:unprocessable_entity)
          expect(json['errors']).not_to be_nil
        end
      end
    end

    it 'retrieves a specific user' do
      user = create(:user)

      get :show, params: { id: user.id }

      expect(response).to be_success

      # check that the user attribute are the same.
      expect(json['user']['about']).to eq(user.about)

      # ensure that private attributes aren't serialized
      expect(json['user']['password']).to eq(nil)
      expect(json['user']['role']).to eq(nil)
    end
  end

  describe 'PUT/PATCH v1/users/:id' do
    before { authenticate_from_token! }

    let(:user) { create(:user) }

    context 'with valid attributes' do
      it 'updates the user' do
        user_attributes[:first_name] = 'Mark'
        put :update, params: { id: user.id, user: user_attributes }

        expect(response).to be_success
        expect(json['user']['first_name']).to eq('Mark')
      end
    end

    context 'with unvalid attributes' do
      it 'returns errors' do
        user_attributes[:email] = nil
        put :update, params: { id: user.id, user: user_attributes }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(json['errors']).not_to be_nil
      end
    end
  end

  describe 'DELETE v1/users' do
    before { authenticate_from_token! }

    let(:user) { create(:user) }

    it 'deletes the user' do
      delete :destroy, params: { id: user.id }
      expect(response).to be_no_content
    end
  end

  describe 'strong params' do
    before { authenticate_from_token! }

    it do
      user_params = [
        :first_name, :last_name, :email, :password, :birthday,
        :website, :about
      ]
      should permit(*user_params)
        .for(:create, params: { user: user_attributes }).on(:user)
    end
  end
end
