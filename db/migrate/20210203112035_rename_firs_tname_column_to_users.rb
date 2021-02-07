class RenameFirsTnameColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :firs_tname, :first_name
  end
end
