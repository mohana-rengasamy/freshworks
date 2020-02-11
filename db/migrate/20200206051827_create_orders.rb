class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.float :subtotal
      t.float :total
      t.float :tax
      t.float :shipping

      t.timestamps null: false
    end
  end
end
