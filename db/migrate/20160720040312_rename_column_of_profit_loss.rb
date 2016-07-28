class RenameColumnOfProfitLoss < ActiveRecord::Migration
  def change
  	rename_column :profit_losses, :month, :pl_month
  end
end
