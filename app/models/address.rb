class Address < ApplicationRecord
    belongs_to :end_user
    has_many :orders
end
