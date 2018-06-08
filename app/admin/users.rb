ActiveAdmin.register User do
  index do
    column :id
    column :first_name
    column :last_name
    column :email
    column :created_at
    actions
  end

  filter :first_name
  filter :last_name
  filter :email

  show do |_s|
    attributes_table do
      row :first_name
      row :last_name
      row :email
    end
  end

  form do |f|
    f.inputs 'Edit user' do
      f.input :first_name
      f.input :last_name
      f.input :email
    end
    f.actions
  end
end
