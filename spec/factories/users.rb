FactoryBot.define do
  factory :user do
    username { Faker::Internet.email }
    password { 'somepassword' }
    password_confirmation { 'somepassword' }
  end
end
