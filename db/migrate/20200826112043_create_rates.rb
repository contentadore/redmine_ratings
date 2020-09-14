class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.integer :user_id
      t.integer :tracker_id
      t.integer :language_id
      t.integer :value
      t.integer :currency_id
      t.integer :unit_qty
      t.integer :unit_type_id
    end
  end
end
