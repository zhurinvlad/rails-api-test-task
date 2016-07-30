FactoryGirl.define do
  factory :user do
    first_name { FFaker::NameDE.first_name }
    last_name  { FFaker::NameDE.last_name }
    email      { FFaker::Internet.email }
    password   { FFaker::Internet.password }
    birthday   { FFaker::Time.date }
    website    { FFaker::Internet.http_url }
    about      { FFaker::CheesyLingo.sentence }
  end
end
