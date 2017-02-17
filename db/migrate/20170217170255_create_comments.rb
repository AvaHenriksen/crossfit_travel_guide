class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :box_id
      t.integer :food_option_id

      t.timestamps

    end
  end
end
