# == Schema Information
#
# Table name: books
#
#  id         :bigint(8)        not null, primary key
#  genre      :string
#  author     :string
#  image      :string
#  title      :string
#  publisher  :string
#  year       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Book < ApplicationRecord
	validates: :genre, :author, :image, :title, :publisher, :year, presence: true
end
