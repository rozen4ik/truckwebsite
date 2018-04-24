class Order < ApplicationRecord
    validates :FLName, :phone, :DescriptionCargo, :PointA, :PointB, presence: true
end
