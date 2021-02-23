class RenamePrefectureIdColumnToShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    rename_column :shipping_addresses, :prefecture_id, :prefecture
  end
end
