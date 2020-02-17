class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.timestamps
      t.integer :genre_id
      t.string :name
      t.text :description
      t.integer :price
      t.integer :status
      t.string :image_id
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
