class AddLocationFormattedAddressToCity < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :location_formatted_address, :string
  end
end
