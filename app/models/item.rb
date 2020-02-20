class Item < ApplicationRecord
    belongs_to :genre
    enum status:[:"販売中", :"販売停止中"]
end
