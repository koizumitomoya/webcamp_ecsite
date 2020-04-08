class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|

      t.timestamps
      t.integer :end_user_id
      t.string :postcode
      t.string :address
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
