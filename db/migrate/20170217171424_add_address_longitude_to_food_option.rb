class AddAddressLongitudeToFoodOption < ActiveRecord::Migration[5.0]
  def change
    add_column :food_options, :address_longitude, :float
  end
end
