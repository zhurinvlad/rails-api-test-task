FactoryGirl.define do
  factory :author do
    first_name { FFaker::NameDE.first_name }
    last_name  { FFaker::NameDE.last_name }
    about      { FFaker::CheesyLingo.sentence }
  end
end
