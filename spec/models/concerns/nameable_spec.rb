RSpec.shared_examples 'nameable' do |factory_name|
  let(:instance) { build(factory_name) }

  describe 'public instance methods' do
    context 'responds to its methods' do
      it { expect(instance).to respond_to(:full_name) }
    end

    context 'executes methods correctly' do
      context '#full_name' do
        let(:first_name) { 'Andrey'   }
        let(:last_name)  { 'Krisanov' }

        subject(:instance) do
          build(factory_name, first_name: first_name, last_name: last_name)
        end

        it 'returns instance full name' do
          expect(instance.full_name).to eq("#{first_name} #{last_name}")

          instance.first_name = first_name
          instance.last_name = nil
          expect(instance.full_name).to eq(first_name)

          instance.first_name = nil
          instance.last_name = last_name
          expect(instance.full_name).to eq(last_name)
        end
      end
    end
  end
end
