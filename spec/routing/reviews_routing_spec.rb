require 'rails_helper'

RSpec.describe Api::V1::ReviewsController, type: :routing do
  describe 'routing to reviews' do
    let(:version)            { 'v1' }
    let(:entity_id)          { '1' }
    let(:reviews_path)       { "#{version}/books/#{entity_id}/reviews" }
    let(:reviews_controller) { "api/#{version}/reviews" }

    it { expect(get: reviews_path).to be_routable }

    it do
      expect(post: reviews_path)
        .to route_to controller: reviews_controller,
                     action: 'create', book_id: entity_id
    end

    it do
      expect(get: "#{reviews_path}/#{entity_id}")
        .to route_to controller: reviews_controller, action: 'show',
                     book_id: entity_id, id: entity_id
    end

    it do
      expect(put: "#{reviews_path}/#{entity_id}")
        .to route_to controller: reviews_controller, action: 'update',
                     book_id: entity_id, id: entity_id
    end

    it do
      expect(patch: "#{reviews_path}/#{entity_id}")
        .to route_to controller: reviews_controller, action: 'update',
                     book_id: entity_id, id: entity_id
    end

    it do
      expect(delete: "#{reviews_path}/#{entity_id}")
        .to route_to controller: reviews_controller, action: 'destroy',
                     book_id: entity_id, id: entity_id
    end
  end
end
