FactoryBot.define do
  factory :tracking do
    date { Faker::Date.between(from: '2021-01-23', to: '2021-01-25') }
    page_no { Faker::Number.number(digits: 2) }
    book
  end
end
