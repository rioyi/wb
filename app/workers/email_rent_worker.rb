class EmailRentWorker
  include Sidekiq::Worker

  def perform(id)
    rent = Rent.find(id)
    RentMailer.notification_of_rent(rent).deliver
  end
end
