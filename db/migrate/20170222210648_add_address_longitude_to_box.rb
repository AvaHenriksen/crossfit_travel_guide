class AddAddressLongitudeToBox < ActiveRecord::Migration[5.0]
  def change
    add_column :boxes, :address_longitude, :float
  end
end
