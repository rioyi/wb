class BookPolicy < ApplicationPolicy
  def index?
    @user.present?
  end

end
