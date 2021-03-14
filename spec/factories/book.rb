FactoryBot.define do
  factory :book do
    name { 'Book1' }
    genre { 'SampleGenre' }
    author { 'TestAuthor' }
    pages { 10 }
    user
  end
end
