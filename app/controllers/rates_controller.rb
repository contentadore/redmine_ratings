class RatesController < ApplicationController
  def destroy
    @rate = Rate.find(params[:id])
    user = @rate.user_id
    @rate.destroy
    redirect_to edit_user_path(user)
  end
end
