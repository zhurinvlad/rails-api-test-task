require 'rails_helper'

RSpec.describe Author, type: :model do
  it 'has a valid factory' do
    expect(build(:author)).to be_valid
  end

  let(:author) { build(:author) }

  it_behaves_like 'nameable', :author

  describe 'ActiveModel validations' do
    # Basic validations
    it { expect(author).to validate_presence_of(:first_name) }
    it { expect(author).to validate_presence_of(:last_name) }
    it do
      expect(author)
        .to validate_uniqueness_of(:first_name).scoped_to(:last_name)
        .case_insensitive
    end
  end
end
