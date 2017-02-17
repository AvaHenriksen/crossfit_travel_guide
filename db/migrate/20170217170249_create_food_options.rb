class CreateFoodOptions < ActiveRecord::Migration
  def change
    create_table :food_options do |t|
      t.integer :city_id
      t.text :details

      t.timestamps

    end
  end
end
