require 'rails_helper'

RSpec.describe Api::V1::AuthorsController, type: :controller do
  let(:author_attributes) { attributes_for(:author) }

  describe 'actions' do
    it 'GET v1/authors' do
      create_list(:author, 10)
      get :index

      expect(response).to be_success
      expect(json['authors'].length).to eq(10)
    end

    describe 'POST v1/authors' do
      before { authenticate_from_token! }

      context 'with valid attributes' do
        it 'creates a new author' do
          post :create, params: { author: author_attributes }
          expect(response).to be_created
        end
      end

      context 'with unvalid attributes' do
        it 'returns errors' do
          author_attributes[:first_name] = nil
          post :create, params: { author: author_attributes }

          expect(response).to have_http_status(:unprocessable_entity)
          expect(json['errors']).not_to be_nil
        end
      end
    end

    it 'retrieves a specific author' do
      author = create(:author)

      get :show, params: { id: author.id }

      expect(response).to be_success

      # check that the author attribute are the same.
      expect(json['author']['about']).to eq(author.about)
    end
  end

  describe 'PUT/PATCH v1/authors/:id' do
    before { authenticate_from_token! }

    let(:author) { create(:author) }

    context 'with valid attributes' do
      it 'updates the author' do
        author_attributes[:first_name] = 'Maria'
        put :update, params: { id: author.id, author: author_attributes }

        expect(response).to be_success
        expect(json['author']['first_name']).to eq('Maria')
      end
    end

    context 'with unvalid attributes' do
      it 'returns errors' do
        author_attributes[:first_name] = nil
        put :update, params: { id: author.id, author: author_attributes }

        expect(response).to have_http_status(:unprocessable_entity)
        expect(json['errors']).not_to be_nil
      end
    end
  end

  describe 'DELETE v1/authors' do
    before { authenticate_from_token! }

    let(:author) { create(:author) }

    it 'deletes the author' do
      delete :destroy, params: { id: author.id }
      expect(response).to be_no_content
    end
  end

  describe 'strong params' do
    before { authenticate_from_token! }

    it do
      author_params = [:first_name, :last_name, :about]
      should permit(*author_params)
        .for(:create, params: { author: author_attributes }).on(:author)
    end
  end
end
