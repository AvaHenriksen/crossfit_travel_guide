class AddBookmarkCountToBoxes < ActiveRecord::Migration[5.0]
  def change
    add_column :boxes, :bookmarks_count, :integer
  end
end
