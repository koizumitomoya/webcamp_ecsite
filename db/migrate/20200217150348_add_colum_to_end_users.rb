class AddColumToEndUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :end_users, :deleted_at, :string
    add_column :end_users, :datatime, :string
  end
end
