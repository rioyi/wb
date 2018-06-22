class NotifyRentDaysMailer < ApplicationMailer
  def notification_of_rent_days(days, rent)
    @days = days
    @rent = rent

    I18n.with_locale(rent.user.locale) do
      mail(to:rent.user.email, subject: I18n.t('email_notification_of_rent_days.subject', days))
    end
  end
end
