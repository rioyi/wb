class AddColumnLocaleToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :locale, :string, default: 'es'
  end
end
