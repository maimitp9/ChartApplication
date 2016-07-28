class CreateCompetitionResults < ActiveRecord::Migration
  def change
    create_table :competition_results do |t|
      t.references :sporter, index: true, foreign_key: true
      t.references :competition, index: true, foreign_key: true
      t.integer :place

      t.timestamps null: false
    end
  end
end
