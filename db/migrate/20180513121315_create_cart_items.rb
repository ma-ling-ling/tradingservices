class CreateCartItems < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_items do |t|
      t.integer :service_id
      t.decimal :hours_ordered
      t.decimal :cart_item_total
      t.text :message_to_provider

      t.timestamps
    end
  end
end
