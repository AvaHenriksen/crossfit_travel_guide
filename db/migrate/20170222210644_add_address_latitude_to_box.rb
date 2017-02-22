class AddAddressLatitudeToBox < ActiveRecord::Migration[5.0]
  def change
    add_column :boxes, :address_latitude, :float
  end
end
