class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book
  after_commit :email_rent, on: :create

  private

  def email_rent
    EmailRentWorker.perform_async(id)
  end
end
