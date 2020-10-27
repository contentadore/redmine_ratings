class AddPriorityToRatingTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :rating_types, :priority, :integer, default: 0
  end
end
