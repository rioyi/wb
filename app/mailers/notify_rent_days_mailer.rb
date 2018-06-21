class NotifyRentDaysMailer < ApplicationMailer
  def notification_of_rent_days(days, user)
    @days = days
    @user = user

    I18n.with_locale(user.locale) do
      mail(to: user.email, subject: days)
    end
  end
end
