class CreateSporters < ActiveRecord::Migration
  def change
    create_table :sporters do |t|
      t.string :name
      t.integer :age
      t.references :country, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
