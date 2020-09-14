class RateRatingsController < ApplicationController
  def index
    @languages = Language.all
    @currencies = Currency.all
  end

  def mass_create
    params['params']['rate'].to_unsafe_h.each_with_index do |p, i|
      @rate = Rate.new

      @rate.user_id = p[1]['user_id']
      @rate.tracker_id = p[1]['tracker_id']
      @rate.language_id = p[1]['language_id']
      @rate.value = p[1]['value']
      @rate.currency_id = p[1]['currency_id']
      @rate.unit_qty = p[1]['unit_qty']
      @rate.unit_type_id = p[1]['unit_type_id']

      @rate.save
    end
  end

  def mass_update
    params['params']['rate'].to_unsafe_h.each_with_index do |p, i|
      @rate = p[1]['id'] == 'nil' ? Rate.new : Rate.find(p[1]['id'])
      @rate.user_id = p[1]['user_id']
      @rate.tracker_id = p[1]['tracker_id']
      @rate.language_id = p[1]['language_id']
      @rate.value = p[1]['value']
      @rate.currency_id = p[1]['currency_id']
      @rate.unit_qty = p[1]['unit_qty']
      @rate.unit_type_id = p[1]['unit_type_id']
      @rate.save
    end
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  end

  def delete
  end
end
