class CreateHerds < ActiveRecord::Migration[6.0]
  def change
    create_table :herds do |t|
      t.string :name
      t.text :description
      t.string :type
      t.float :unit_price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
