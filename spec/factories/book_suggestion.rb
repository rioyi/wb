FactoryBot.define do
  factory :book_suggestion do
    editorial Faker::Company.name
    price Faker::Number.decimal(2)
    author Faker::Book.author
    title Faker::Book.title
    link image Faker::Internet.url('example.com', '/foobar.html')
    publisher Faker::Book.publisher
    year Faker::Number.number(4)
  end
end
