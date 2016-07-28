class CreateProfitLosses < ActiveRecord::Migration
  def change
    create_table :profit_losses do |t|
      t.integer :ki
      t.integer :tenpo
      t.integer :month
      t.decimal :rieki

      #t.timestamps null: false
    end
  end
end
