ActiveAdmin.register Rent do
  permit_params :user_id, :book_id, :from, :to
end
