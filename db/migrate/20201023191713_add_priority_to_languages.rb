class AddPriorityToLanguages < ActiveRecord::Migration[5.2]
  def change
    add_column :languages, :priority, :integer, default: 0
  end
end
