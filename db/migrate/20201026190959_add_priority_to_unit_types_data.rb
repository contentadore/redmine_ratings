class AddPriorityToUnitTypesData < ActiveRecord::Migration[5.2]
  def change
    UnitType.all.each_with_index do |unit_type, index|
      unit_type.update(priority: index)
    end
  end
end
