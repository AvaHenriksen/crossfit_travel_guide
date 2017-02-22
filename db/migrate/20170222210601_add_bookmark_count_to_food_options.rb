class AddBookmarkCountToFoodOptions < ActiveRecord::Migration[5.0]
  def change
    add_column :food_options, :bookmarks_count, :integer
  end
end
