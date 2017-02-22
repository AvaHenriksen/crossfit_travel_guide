class AddBoxCountToCities < ActiveRecord::Migration[5.0]
  def change
    add_column :cities, :boxes_count, :integer
  end
end
