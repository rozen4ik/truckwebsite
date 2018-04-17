class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :FLName
      t.integer :phone
      t.text :DescriptionCargo
      t.string :PointA
      t.string :PointB

      t.timestamps
    end
  end
end
