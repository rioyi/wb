FactoryBot.define do
  factory :book do
    genre Faker::Book.title
    author Faker::Book.title
    image  Faker::Book.title
    title Faker::Book.title
    publisher Faker::Book.title
    year Faker::Book.title
  end
end
