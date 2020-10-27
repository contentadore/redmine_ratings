class AddPriorityToRatingTypesData < ActiveRecord::Migration[5.2]
  def change
    RatingType.all.each_with_index do |rating_type, index|
      rating_type.update(priority: index)
    end
  end
end
