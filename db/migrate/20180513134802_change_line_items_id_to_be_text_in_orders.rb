class ChangeLineItemsIdToBeTextInOrders < ActiveRecord::Migration[5.1]
  def change
  	change_column :orders, :line_items_id, :string
  end
end
