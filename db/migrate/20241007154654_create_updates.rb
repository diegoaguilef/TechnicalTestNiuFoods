class CreateUpdates < ActiveRecord::Migration[7.0]
  def change
    create_table :updates do |t|
      t.string :name, null: false
      t.string :version
      t.integer :status
      t.string :details, null: false
      t.references :device, null: false, foreign_key: true

      t.timestamps
    end
  end
end
