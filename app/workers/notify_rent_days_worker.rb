class NotifyRentDaysWorker
  include Sidekiq::Worker

  def perform
    Rent.send_email_to_user
  end
end
