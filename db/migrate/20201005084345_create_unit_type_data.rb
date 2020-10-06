class CreateUnitTypeData < ActiveRecord::Migration[5.2]
  def up
    UnitType.create(value: 'Symbols')
    UnitType.create(value: 'Words')
    UnitType.create(value: 'Hours')
    UnitType.create(value: 'Minutes')
    UnitType.create(value: 'Days')
    UnitType.create(value: 'Weeks')
    UnitType.create(value: 'Months')
  end

  def down
  end
end
