class ChangeTypeToSpeciesInHerds < ActiveRecord::Migration[6.0]
  def change
    rename_column :herds, :type, :species
  end
end
