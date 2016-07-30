require 'rails_helper'

describe UserSerializer, type: :serializer do
  let(:object) { create(:user) }

  subject { serialize(object) }

  it { is_expected.to match_response_schema('user') }
end
