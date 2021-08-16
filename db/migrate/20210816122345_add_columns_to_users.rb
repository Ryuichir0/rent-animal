class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :address, :string
    add_column :users, :birthdate, :date
    add_column :users, :phone, :integer
  end
end
