class CreateIssueLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :issue_languages do |t|
      t.string :value
      t.references :issue

    end
  end
end
