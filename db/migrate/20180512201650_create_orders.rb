class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :line_items_id
      t.decimal :subtotal
      t.decimal :fees
      t.decimal :grand_total

      t.timestamps
    end
  end
end
