class AlterTitleFromCountry < ActiveRecord::Migration
  def change
  	rename_column :countries, :title, :name
  end
end
