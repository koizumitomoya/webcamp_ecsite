class Item < ApplicationRecord
    belongs_to :genre
    has_many :order_details
    enum status:[:"販売中", :"販売停止中"]
  
end
