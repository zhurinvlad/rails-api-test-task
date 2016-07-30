require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  let(:user) { build(:user) }

  describe 'ActiveModel validations' do
    # Basic validations
    it { expect(user).to validate_presence_of(:email) }
    it { expect(user).to validate_uniqueness_of(:email).case_insensitive }
    it do
      expect(user).to validate_uniqueness_of(:first_name)
        .scoped_to(:last_name).case_insensitive
    end

    describe 'password validations on create' do
      subject(:user) { User.new }
      it { expect(user).to validate_presence_of(:password).on(:create) }

      it do
        expect(user).to validate_length_of(:password).is_at_least(8)
          .on(:create)
      end
    end

    # Format validations
    it { expect(user).to allow_value('develop4net@ya.ru').for(:email) }
    it { expect(user).to_not allow_value('foo@bar').for(:email) }
    it { expect(user).to_not allow_value('foobar').for(:email) }
  end

  describe 'public instance methods' do
    context 'responds to its methods' do
      it { expect(user).to respond_to(:full_name) }
    end

    context 'executes methods correctly' do
      context '#full_name' do
        let(:first_name) { 'Andrey'   }
        let(:last_name)  { 'Krisanov' }

        subject(:user) do
          build(:user, first_name: first_name, last_name: last_name)
        end

        it 'returns user full name' do
          expect(user.full_name).to eq("#{first_name} #{last_name}")

          user.first_name = first_name
          user.last_name = nil
          expect(user.full_name).to eq(first_name)

          user.first_name = nil
          user.last_name = last_name
          expect(user.full_name).to eq(last_name)
        end
      end
    end
  end
end
