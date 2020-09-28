class CreateLanguagesData < ActiveRecord::Migration[5.2]
  def up
    Language.create(value: 'Russian')
    Language.create(value: 'Ukrainian')
    Language.create(value: 'English')
    Language.create(value: 'Arabic')
    Language.create(value: 'Vietnamese')
    Language.create(value: 'Dutch')
    Language.create(value: 'Greek')
    Language.create(value: 'Danish')
    Language.create(value: 'Hebrew')
    Language.create(value: 'Indonesian')
    Language.create(value: 'Spanish')
    Language.create(value: 'Italian')
    Language.create(value: 'Chinese')
    Language.create(value: 'Korean')
    Language.create(value: 'Malay')
    Language.create(value: 'German')
    Language.create(value: 'Norwegian')
    Language.create(value: 'Polish')
    Language.create(value: 'Portuguese')
    Language.create(value: 'Romanian')
    Language.create(value: 'Slovenian')
    Language.create(value: 'Thai')
    Language.create(value: 'Turkish')
    Language.create(value: 'Finnish')
    Language.create(value: 'French')
    Language.create(value: 'Czech')
    Language.create(value: 'Swedish')
  end

  def down
  end
end
