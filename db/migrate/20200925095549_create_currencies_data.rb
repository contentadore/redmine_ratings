class CreateCurrenciesData < ActiveRecord::Migration[5.2]
  def up
    Currency.create(value: '$')
    Currency.create(value: '€')
    Currency.create(value: '₴')
  end

  def down
  end
end
