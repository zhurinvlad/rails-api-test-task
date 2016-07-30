require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'has a valid factory' do
    expect(build(:book)).to be_valid
  end

  let(:book) { build(:book) }

  describe 'ActiveModel validations' do
    # Basic validations
    it { expect(book).to validate_presence_of(:isbn) }
    it { expect(book).to validate_uniqueness_of(:isbn).case_insensitive }
    it { expect(book).to validate_presence_of(:title) }
    it { expect(book).to validate_numericality_of(:pages).is_greater_than(0) }
    it { expect(book).to validate_presence_of(:published) }
  end
end
