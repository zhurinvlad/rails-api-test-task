require 'rails_helper'

RSpec.describe Api::V1::BooksController, type: :controller do
  let(:book_attributes) { attributes_for(:book) }

  describe 'actions' do
    it 'GET v1/books' do
      create_list(:book, 10)

      get :index

      json = JSON.parse(response.body)

      expect(response).to be_success

      expect(json['books'].length).to eq(10)
    end

    describe 'POST v1/books' do
      context 'with valid attributes' do
        it 'creates a new book' do
          book_attributes[:author_id] = create(:author).id
          post :create, params: { book: book_attributes }
          expect(response).to be_created
        end
      end

      context 'with unvalid attributes' do
        it 'returns errors' do
          book_attributes[:isbn] = nil
          post :create, params: { book: book_attributes }

          expect(response).to have_http_status(:unprocessable_entity)

          expect(json['errors']).not_to be_nil
        end
      end
    end

    it 'retrieves a specific book' do
      book = create(:book)

      get :show, params: { id: book.id }

      expect(response).to be_success

      # check that the book attribute are the same.
      expect(json['book']['description']).to eq(book.description)
    end
  end

  describe 'PUT/PATCH v1/books/:id' do
    let(:book) { create(:book, title: 'The RSpec Book') }

    context 'with valid attributes' do
      it 'updates the book' do
        put :update, params: { id: book.id, book: book_attributes }
        expect(book.title).to eq('The RSpec Book')
      end
    end

    context 'with unvalid attributes' do
      it 'returns errors' do
        book_attributes[:isbn] = nil
        put :update, params: { id: book.id, book: book_attributes }

        expect(response).to have_http_status(:unprocessable_entity)

        expect(json['errors']).not_to be_nil
      end
    end
  end

  describe 'DELETE v1/books' do
    let(:book) { create(:book) }

    it 'deletes the book' do
      delete :destroy, params: { id: book.id }
      expect(response).to be_no_content
    end
  end

  describe 'strong params' do
    it do
      book_params = [:isbn, :title, :description, :pages, :website, :published,
                     :author_id]
      should permit(*book_params)
        .for(:create, params: { book: book_attributes }).on(:book)
    end
  end
end
