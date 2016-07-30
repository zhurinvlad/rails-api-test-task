require 'rails_helper'

RSpec.describe Api::V1::ReviewsController, type: :routing do
  let(:review_attributes) { attributes_for(:review) }

  # describe 'actions' do
  #   it 'GET v1/reviews' do
  #     create_list(:review, 10)
  #
  #     get :index
  #
  #     json = JSON.parse(response.body)
  #
  #     expect(response).to be_success
  #
  #     expect(json['reviews'].length).to eq(10)
  #   end
  #
  #   describe 'POST v1/reviews' do
  #     context 'with valid attributes' do
  #       it 'creates a new review' do
  #         review_attributes[:author_id] = create(:author).id
  #         post :create, params: { review: review_attributes }
  #         expect(response).to be_created
  #       end
  #     end
  #
  #     context 'with unvalid attributes' do
  #       it 'returns errors' do
  #         review_attributes[:isbn] = nil
  #         post :create, params: { review: review_attributes }
  #
  #         expect(response).to have_http_status(:unprocessable_entity)
  #
  #         expect(json['errors']).not_to be_nil
  #       end
  #     end
  #   end
  #
  #   it 'retrieves a specific review' do
  #     review = create(:review)
  #
  #     get :show, params: { id: review.id }
  #
  #     expect(response).to be_success
  #
  #     # check that the review attribute are the same.
  #     expect(json['review']['description']).to eq(review.description)
  #   end
  # end
  #
  # describe 'PUT/PATCH v1/reviews/:id' do
  #   let(:review) { create(:review, title: 'The RSpec review') }
  #
  #   context 'with valid attributes' do
  #     it 'updates the review' do
  #       put :update, params: { id: review.id, review: review_attributes }
  #       expect(review.title).to eq('The RSpec review')
  #     end
  #   end
  #
  #   context 'with unvalid attributes' do
  #     it 'returns errors' do
  #       review_attributes[:isbn] = nil
  #       put :update, params: { id: review.id, review: review_attributes }
  #
  #       expect(response).to have_http_status(:unprocessable_entity)
  #
  #       expect(json['errors']).not_to be_nil
  #     end
  #   end
  # end
  #
  # describe 'DELETE v1/reviews' do
  #   let(:review) { create(:review) }
  #
  #   it 'deletes the review' do
  #     delete :destroy, params: { id: review.id }
  #     expect(response).to be_no_content
  #   end
  # end
  #
  # describe 'strong params' do
  #   it do
  #     review_params = [:text]
  #     should permit(*review_params)
  #       .for(:create, params: { review: review_attributes }).on(:review)
  #   end
  # end
end
