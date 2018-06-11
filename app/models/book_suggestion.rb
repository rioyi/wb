class BookSuggestion < ApplicationRecord
  belongs_to :user
  validates :editorial, :price, :title, :link, :publisher, :author, :year, :user_id, presence: true
end
