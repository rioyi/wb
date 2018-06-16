class RentMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.rent_mailer.notification_of_registered_data.subject
  #
  def notification_of_registered_data(rent, book)
    # @rent = rent
    # @book = book
    # mail to: email, subject: "Felicidades la renta del libro N: #{book.id} ha sido exitosa"
    mail to: 'wilbert.angarita@gmail.com', subject: "Felicidades la renta del libro N: "
  end
end
