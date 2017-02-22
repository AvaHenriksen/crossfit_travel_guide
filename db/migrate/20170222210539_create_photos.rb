class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.integer :box_id
      t.integer :food_option_id

      t.timestamps

    end
  end
end
