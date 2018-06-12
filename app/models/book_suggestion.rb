class BookSuggestion < ApplicationRecord
  belongs_to :user, optional: true
  validates :editorial, :price, :title, :link, :publisher, :author, :year, presence: true
end
