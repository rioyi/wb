require 'rails_helper'
describe Book, type: :model do
  it { should validate_presence_of(:genre) }
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:image) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:publisher) }
  it { should validate_presence_of(:year) }

  it '#create book' do
    book = create(:book)
    expect(book.valid?).to eq(true)
  end
end
