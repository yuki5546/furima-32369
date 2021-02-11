class RenameShoppingFeeStatusIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :shopping_fee_status_id, :shipping_fee_status_id
  end
end
