class AddPriorityToLanguagesData < ActiveRecord::Migration[5.2]
  def change
    Language.all.each_with_index do |language, index|
      language.update(priority: index)
    end
  end
end
