require 'rails_helper'

describe ReviewSerializer, type: :serializer do
  let(:object) { create(:review) }

  subject { serialize(object) }

  it { is_expected.to match_response_schema('review') }
end
