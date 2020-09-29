class CreateCreateRatingTypeData < ActiveRecord::Migration[5.2]
  def up
    RatingType.create(value: 'Contact')
    RatingType.create(value: 'Professionalism')
    RatingType.create(value: 'Deadline')
    RatingType.create(value: 'WorkQuality')
  end

  def down
  end
end
