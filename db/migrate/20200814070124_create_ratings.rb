class CreateRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :ratings do |t|
      t.integer :rate_id
      t.integer :issue_id
      t.integer :type_id
      t.integer :value
      t.integer :author_role_id
      t.integer :author_id
    end
  end
end
