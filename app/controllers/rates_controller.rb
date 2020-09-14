class RatesController < ApplicationController
  def mass_create
    params['params'].each do |p|
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

  def show_by_users_id
    user = User.find(params[:id])
    @rates = Rate.where(user_id: user.id)
  end

  def edit_by_users_id
    @user = User.find(params[:id])
    @rates = Rate.where(user_id: @user.id)
  end

  def mass_update
    user = User.find(params['params']['id'])
    @rates = Rate.where(user_id: user.id)

    params['params'].each do |p|

      unless p[0] == 'id'
        if @rates.count - 1 < p[0].to_i
          @rate = Rate.new

          @rate.user_id = p[1]['user_id']
          @rate.tracker_id = p[1]['tracker_id']
          @rate.language_id = p[1]['language_id']
          @rate.value = p[1]['value']
          @rate.currency_id = p[1]['currency_id']
          @rate.unit_qty = p[1]['unit_qty']
          @rate.unit_type_id = p[1]['unit_type_id']

          @rate.save
        else
          rate = @rates[p[0].to_i]

          rate.user_id = p[1]['user_id']
          rate.tracker_id = p[1]['tracker_id']
          rate.language_id = p[1]['language_id']
          rate.value = p[1]['value']
          rate.currency_id = p[1]['currency_id']
          rate.unit_qty = p[1]['unit_qty']
          rate.unit_type_id = p[1]['unit_type_id']

          rate.save
        end
      end
    end
  end

  def new
    @rate = Rate.new
  end

  def create
    rate_params = params.require(:rate).permit(
      :user_id, :tracker_id, :language_id, :value, :currency_id, :unit_qty, :unit_type_id
    )

    @rate = Rate.new(rate_params)

    @rate.save
    redirect_to @rate
  end

  def edit
    @rate = Rate.find(params[:id])
  end

  def update
    @rate = Rate.find(params[:id])

    rate_params = params.require(:rate).permit(
      :user_id, :tracker_id, :language_id, :value, :currency_id, :unit_qty, :unit_type_id
    )

    @rate.update(rate_params)
    redirect_to @rate
  end

  def show
    @rate = Rate.find(params[:id])
  end

  def delete
  end
end
