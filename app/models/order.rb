class Order < ApplicationRecord
    validates :fl_name, :phone, :description_cargo, :point_a, :point_b, presence: true
end
