require 'rails_helper'

RSpec.describe Api::V1::ReviewsController, type: :controller do
  let(:review_attributes) { attributes_for(:review) }
  let(:book)              { create(:book) }

  describe 'actions' do
    it 'GET v1/reviews' do
      create_list(:review, 10, book: book)

      get :index, params: { book_id: book.id }

      json = JSON.parse(response.body)

      expect(response).to be_success
      expect(json['reviews'].length).to eq(10)
    end

    describe 'POST v1/reviews' do
      before { authenticate_from_token! }

      context 'with valid attributes' do
        it 'creates a new review' do
          post :create, params: { book_id: book.id, review: review_attributes }
          expect(response).to be_created
        end
      end

      context 'with unvalid attributes' do
        it 'returns errors' do
          review_attributes[:text] = nil
          post :create, params: { book_id: book.id, review: review_attributes }
          expect(json['errors']).not_to be_nil
        end
      end
    end

    it 'retrieves a specific review' do
      review = create(:review)

      get :show, params: { book_id: book.id, id: review.id }

      expect(response).to be_success
      # check that the review attribute are the same.
      expect(json['review']['text']).to eq(review.text)
    end
  end

  describe 'PUT/PATCH v1/reviews/:id' do
    context 'admin or review author' do
      before do
        @authorized_user = authenticate_from_token!
      end

      let(:review) do
        create(:review, user: @authorized_user)
      end

      context 'with valid attributes' do
        it 'updates the review' do
          review_attributes[:text] = 'Awesome book!'
          put :update, params: { book_id: book.id, id: review.id,
                                 review: review_attributes }

          expect(response).to be_success
          expect(json['review']['text']).to eq('Awesome book!')
        end
      end

      context 'with unvalid attributes' do
        it 'returns errors' do
          review_attributes[:text] = nil
          put :update, params: { book_id: book.id, id: review.id,
                                 review: review_attributes }

          expect(response).to have_http_status(:unprocessable_entity)
          expect(json['errors']).not_to be_nil
        end
      end
    end

    context 'not admin or review author' do
      before { authenticate_from_token! }

      let(:review) { create(:review) }

      it 'returns forbidden error' do
        put :update, params: { book_id: book.id, id: review.id,
                               review: review_attributes }

        expect(response).to be_forbidden
        expect(json['errors']['access']).not_to be_nil
      end
    end
  end

  describe 'DELETE v1/reviews' do
    context 'admin or review author' do
      before do
        @authorized_user = authenticate_from_token!
      end

      let(:review) { create(:review, user: @authorized_user) }

      it 'deletes the review' do
        delete :destroy, params: { book_id: book.id, id: review.id }
        expect(response).to be_no_content
      end
    end

    context 'not admin or review author' do
      before { authenticate_from_token! }

      let(:review) { create(:review) }

      it 'returns forbidden error' do
        delete :destroy, params: { book_id: book.id, id: review.id }

        expect(response).to be_forbidden
        expect(json['errors']['access']).not_to be_nil
      end
    end
  end

  describe 'strong params' do
    before { authenticate_from_token! }

    it do
      review_params = [:text]
      should permit(*review_params)
        .for(:create,
             params: { book_id: book.id, review: review_attributes })
        .on(:review)
    end
  end
end
