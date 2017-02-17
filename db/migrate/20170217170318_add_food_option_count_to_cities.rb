class AddFoodOptionCountToCities < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :food_options_count, :integer
  end
end
