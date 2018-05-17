class AddDurationToServices < ActiveRecord::Migration[5.1]
  def change
    add_column :services, :duration_min, :decimal
    add_column :services, :duration_max, :decimal
  end
end
