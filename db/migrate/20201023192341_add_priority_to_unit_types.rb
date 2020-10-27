class AddPriorityToUnitTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :unit_types, :priority, :integer, default: 0
  end
end
