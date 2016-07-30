require 'rails_helper'

describe BookSerializer, type: :serializer do
  let(:object) { create(:book) }

  subject { serialize(object) }

  it { is_expected.to match_response_schema('book') }
end
