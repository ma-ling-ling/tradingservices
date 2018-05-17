class CreateLineItems < ActiveRecord::Migration[5.1]
  def change
    create_table :line_items do |t|
      t.integer :service_id
      t.decimal :hours_ordered
      t.decimal :line_item_total
      t.text :message_to_provider
      t.integer :order_id

      t.timestamps
    end
  end
end
