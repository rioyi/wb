class EmailRentWorker
  include Sidekiq::Worker

  def perform(id)
    # rent  = Rent.find(id)
    # p book  = rent.book.title
    # rent = 'Cats'
    RentMailer.notification_of_registered_data('cats','putas').deliver
  end
end
