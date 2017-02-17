class AddLocationLongitudeToCity < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :location_longitude, :float
  end
end
