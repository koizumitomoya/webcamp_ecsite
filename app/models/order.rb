class Order < ApplicationRecord
    enum method:[:"現金", :"カード"]
    belongs_to :address
    has_many :order_details
    enum status:[:"入金待ち", :"入金確認", :"制作中",:"発送準備中", :"発送済み" ]
end
