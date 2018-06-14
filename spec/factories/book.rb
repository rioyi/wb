FactoryBot.define do
  factory :book do
    title Faker::Book.title
    author Faker::Book.author
    publisher Faker::Book.publisher
    genre Faker::Book.genre
    image Faker::Internet.url('example.com', '/foobar.jpg')
    year Faker::Number.number(4)
  end
end
