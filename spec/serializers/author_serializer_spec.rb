require 'rails_helper'

describe AuthorSerializer, type: :serializer do
  let(:object) { create(:author) }

  subject { serialize(object) }

  it { is_expected.to match_response_schema('author') }
end
