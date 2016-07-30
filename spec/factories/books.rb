FactoryGirl.define do
  factory :book do
    isbn        { FFaker::Identification.ssn }
    title       { FFaker::CheesyLingo.title }
    description { FFaker::CheesyLingo.paragraph }
    pages       { rand(1..10_000) }
    website     { FFaker::Internet.http_url }
    published   { FFaker::Time.date }
  end
end
