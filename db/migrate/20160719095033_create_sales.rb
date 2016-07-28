class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :ki
      t.integer :tenpo
      t.integer :month
      t.decimal :uriage

      #t.timestamps null: false
    end
  end
end
