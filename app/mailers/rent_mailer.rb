class RentMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.rent_mailer.notification_of_registered_data.subject
  #
  def notification_of_rent(rent)
    @rent = rent
    I18n.with_locale(rent.user.locale) do
      mail(to: rent.user.email, subject: I18n.t('email_rent_template.creation_date'))
    end
  end
end
