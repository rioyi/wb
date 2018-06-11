class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :publisher, :genre, :year, :image
end
