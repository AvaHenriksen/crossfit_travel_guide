class AddLocationLatitudeToCity < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :location_latitude, :float
  end
end
