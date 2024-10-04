class CreateDevices < ActiveRecord::Migration[7.0]
  def change
    create_table :devices do |t|
      t.string :name
      t.float :version
      t.string :status
      t.references :category, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
