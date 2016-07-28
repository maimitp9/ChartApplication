class RenameColumnOfSales < ActiveRecord::Migration
  def change
  	rename_column :sales, :month, :sale_month
  end
end
