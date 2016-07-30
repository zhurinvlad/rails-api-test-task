require 'rails_helper'

RSpec.describe Api::V1::BooksController, type: :routing do
  describe 'routing to users' do
    let(:version)          { 'v1' }
    let(:books_path)       { "#{version}/books" }
    let(:books_controller) { "api/#{books_path}" }
    let(:book_id)          { '1' }

    it { expect(get: books_path).to be_routable }

    it do
      expect(post: books_path).to route_to controller: books_controller,
                                           action: 'create'
    end

    it do
      expect(get: "#{books_path}/#{book_id}").to(
        route_to(controller: books_controller, action: 'show', id: book_id)
      )
    end

    it do
      expect(put: "#{books_path}/#{book_id}").to(
        route_to(controller: books_controller, action: 'update', id: book_id)
      )
    end

    it do
      expect(patch: "#{books_path}/#{book_id}").to(
        route_to(controller: books_controller, action: 'update', id: book_id)
      )
    end

    it do
      expect(delete: "#{books_path}/#{book_id}").to(
        route_to(controller: books_controller, action: 'destroy', id: book_id)
      )
    end
  end
end
