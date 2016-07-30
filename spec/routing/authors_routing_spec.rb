require 'rails_helper'

RSpec.describe Api::V1::AuthorsController, type: :routing do
  describe 'routing to users' do
    let(:version)            { 'v1' }
    let(:authors_path)       { "#{version}/authors" }
    let(:authors_controller) { "api/#{authors_path}" }
    let(:book_id)            { '1' }

    it { expect(get: authors_path).to be_routable }

    it do
      expect(post: authors_path).to route_to controller: authors_controller,
                                             action: 'create'
    end

    it do
      expect(get: "#{authors_path}/#{book_id}").to(
        route_to(controller: authors_controller, action: 'show', id: book_id)
      )
    end

    it do
      expect(put: "#{authors_path}/#{book_id}").to(
        route_to(controller: authors_controller, action: 'update', id: book_id)
      )
    end

    it do
      expect(patch: "#{authors_path}/#{book_id}").to(
        route_to(controller: authors_controller, action: 'update', id: book_id)
      )
    end

    it do
      expect(delete: "#{authors_path}/#{book_id}").to(
        route_to(controller: authors_controller, action: 'destroy', id: book_id)
      )
    end
  end
end
