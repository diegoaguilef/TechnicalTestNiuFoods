class CreateRestaurants < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :address
      t.references :commune, null: false, foreign_key: true

      t.timestamps
    end
  end
end
