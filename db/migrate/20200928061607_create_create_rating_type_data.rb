class CreateCreateRatingTypeData < ActiveRecord::Migration[5.2]
  def up
    RatingType.create(value: 'Contact Rating')
    RatingType.create(value: 'Professionalism Rating')
    RatingType.create(value: 'Deadline Rating')
    RatingType.create(value: 'WorkQuality Rating')
  end

  def down
  end
end
