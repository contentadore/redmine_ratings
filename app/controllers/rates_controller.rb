class RatesController < ApplicationController
  def index
    if params[:filter] == 'user'
      @rates = Rate.sort_by_user_name
    elsif params[:filter] == 'tracker'
      @rates = Rate.sort_by_tracker_name
    elsif params[:filter] == 'language'
      @rates = Rate.sort_by_language_value
    elsif params[:filter] == 'value'
      @rates = Rate.sort_by_value
    elsif params[:filter] == 'currency'
      @rates = Rate.sort_by_currency_value
    elsif params[:filter] == 'unit_qty'
      @rates = Rate.sort_by_unit_qty
    elsif params[:filter] == 'unit_type'
      @rates = Rate.sort_by_unit_type_value
    else
      @rates = Rate.all
    end
  end

  def destroy
    @rate = Rate.find(params[:id])
    user = @rate.user_id
    @rate.destroy
    redirect_to edit_user_path(user)
  end
end
