class CreateOrderItemHistories < ActiveRecord::Migration
  def change
    create_table :order_item_histories do |t|
      t.integer :user_id
      t.integer :product_id
      t.timestamps null: false
    end
  end
end
