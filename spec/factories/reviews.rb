FactoryGirl.define do
  factory :review do
    text { FFaker::CheesyLingo.sentence }
    user
    book
  end
end
