class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :book
  after_commit :email_rent, on: :create

  # called from worker notify rent days
  def self.send_email_to_user
    rents = rents_not_expired
    return false if rents.empty?
    rents.each do |r|
      days = (r.to - Time.zone.today).to_i
      NotifyRentDaysMailer.notification_of_rent_days(days, r.user).deliver
    end
  end

  # query rents to date < today
  def self.rents_not_expired
    where('"to" > ?', Time.zone.today)
  end

  private

  def email_rent
    EmailRentWorker.perform_async(id)
  end
end
