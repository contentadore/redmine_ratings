class Rate < ActiveRecord::Base
  scope :sort_by_user_name, -> { sort_by(&:user_name) }
  scope :sort_by_tracker_name, -> { sort_by(&:tracker_name) }
  scope :sort_by_language_value, -> { sort_by(&:language_value) }
  scope :sort_by_value, -> { sort_by(&:value) }
  scope :sort_by_currency_value, -> { sort_by(&:currency_value) }
  scope :sort_by_unit_qty, -> { sort_by(&:unit_qty) }
  scope :sort_by_unit_type_value, -> { sort_by(&:unit_type_value) }

  def user_name
    User.where(id: user_id).first.try(:name)
  end

  def tracker_name
    Tracker.where(id: tracker_id).first.try(:name)
  end

  def language_value
    Language.where(id: language_id).first.try(:value)
  end

  def currency_value
    Currency.where(id: currency_id).first.try(:value)
  end

  def unit_type_value
    UnitType.where(id: unit_type_id).first.try(:value)
  end
end
