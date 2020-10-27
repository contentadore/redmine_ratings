class RatingTypesController < ApplicationController
  def index
    @rating_types = RatingType.all.sort_by(&:priority)
  end

  def new
    @rating_type = RatingType.new
  end

  def create
    rating_type_params = params.require(:rating_type).permit(:value, :priority)
    @rating_type = RatingType.new(rating_type_params)
    @rating_type.save
    redirect_to @rating_type
  end

  def edit
    @rating_type = RatingType.find(params[:id])
  end

  def update
    @rating_type = RatingType.find(params[:id])
    rating_type_params = params.require(:rating_type).permit(:value, :priority)
    @rating_type.update(rating_type_params)
    redirect_to @rating_type
  end

  def show
    @rating_type = RatingType.find(params[:id])
  end

  def destroy
    @rating_type = RatingType.find(params[:id])
    @rating_type.destroy
    redirect_to rating_types_path
  end
end
