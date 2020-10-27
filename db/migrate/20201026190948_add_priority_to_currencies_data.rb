class AddPriorityToCurrenciesData < ActiveRecord::Migration[5.2]
  def change
    Currency.all.each_with_index do |currency, index|
      currency.update(priority: index)
    end
  end
end
