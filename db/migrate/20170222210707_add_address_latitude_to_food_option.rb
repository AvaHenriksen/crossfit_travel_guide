class AddAddressLatitudeToFoodOption < ActiveRecord::Migration[5.0]
  def change
    add_column :food_options, :address_latitude, :float
  end
end
