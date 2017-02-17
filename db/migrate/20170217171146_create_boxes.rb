class CreateBoxes < ActiveRecord::Migration
  def change
    create_table :boxes do |t|
      t.integer :city_id
      t.text :details
      t.string :name
      t.string :address

      t.timestamps

    end
  end
end
