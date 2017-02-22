class AddAddressFormattedAddressToFoodOption < ActiveRecord::Migration[5.0]
  def change
    add_column :food_options, :address_formatted_address, :string
  end
end
