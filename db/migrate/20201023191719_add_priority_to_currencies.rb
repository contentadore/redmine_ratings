class AddPriorityToCurrencies < ActiveRecord::Migration[5.2]
  def change
    add_column :currencies, :priority, :integer, default: 0
  end
end
