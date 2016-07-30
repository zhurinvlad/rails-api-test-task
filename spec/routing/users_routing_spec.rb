require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :routing do
  describe 'routing to users' do
    let(:version)          { 'v1' }
    let(:users_path)       { "#{version}/users" }
    let(:users_controller) { "api/#{users_path}" }
    let(:user_id)          { '1' }

    it { expect(get: users_path).to be_routable }

    it do
      expect(post: users_path).to route_to controller: users_controller,
                                           action: 'create'
    end

    it do
      expect(get: "#{users_path}/#{user_id}")
        .to route_to controller: users_controller, action: 'show', id: user_id
    end

    it do
      expect(put: "#{users_path}/#{user_id}")
        .to route_to controller: users_controller, action: 'update', id: user_id
    end

    it do
      expect(patch: "#{users_path}/#{user_id}")
        .to route_to controller: users_controller, action: 'update', id: user_id
    end

    it do
      expect(delete: "#{users_path}/#{user_id}")
        .to route_to controller: users_controller, action: 'destroy',
                     id: user_id
    end
  end
end
