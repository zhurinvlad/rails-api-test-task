require 'spec_helper'

describe ReviewPolicy, type: :policy do
  subject { described_class }

  permissions :update?, :destroy? do
    it 'grants access if user is an admin' do
      expect(subject).to permit(build(:user, role: :admin), build(:review))
    end

    it 'grants access if user is an review author' do
      user = build(:user)
      expect(subject).to permit(user, build(:review, user: user))
    end
  end
end
