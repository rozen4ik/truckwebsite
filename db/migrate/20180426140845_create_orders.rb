class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :fl_name
      t.string :phone
      t.text :description_cargo
      t.string :point_a
      t.string :point_b
      t.string :status

      t.timestamps
    end

    change_column_default :orders, :status, 'Ожидает потверждения'
  end
end
