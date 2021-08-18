class AddCoordinatesToHerds < ActiveRecord::Migration[6.0]
  def change
    add_column :herds, :address, :string
    add_column :herds, :latitude, :float
    add_column :herds, :longitude, :float

  end
end
