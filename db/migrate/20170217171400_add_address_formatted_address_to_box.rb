class AddAddressFormattedAddressToBox < ActiveRecord::Migration[5.0]
  def change
    add_column :boxes, :address_formatted_address, :string
  end
end
