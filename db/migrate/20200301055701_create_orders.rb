class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.timestamps
      t.integer :end_user_id
      t.string :delivery_postcode
      t.string :delivery_address
      t.string :delivery_name
      t.integer :postage
      t.integer :total
      t.integer :status
      t.integer :method
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
