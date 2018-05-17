class RemoveLineItemsIdFromOrders < ActiveRecord::Migration[5.1]
  def change
    remove_column :orders, :line_items_id, :string
  end
end
