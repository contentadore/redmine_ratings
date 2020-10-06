class UnitTypesController < ApplicationController
  def index
    @unit_types = UnitType.all
  end

  def new
    @unit_type = UnitType.new
  end

  def create
    unit_type_params = params.require(:unit_type).permit(:value)
    @unit_type = UnitType.new(unit_type_params)
    @unit_type.save
    redirect_to @unit_type
  end

  def edit
    @unit_type = UnitType.find(params[:id])
  end

  def update
    @unit_type = UnitType.find(params[:id])
    unit_type_params = params.require(:unit_type).permit(:value)
    @unit_type.update(unit_type_params)
    redirect_to @unit_type
  end

  def show
    @unit_type = UnitType.find(params[:id])
  end

  def destroy
    @unit_type = unit_type.find(params[:id])
    @unit_type.destroy
    redirect_to languages_path
  end
end
