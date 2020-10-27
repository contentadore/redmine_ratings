class LanguagesController < ApplicationController
  def index
    @languages = Language.all.sort_by(&:priority)
  end

  def new
    @language = Language.new
  end

  def create
    language_params = params.require(:language).permit(:value, :priority)
    @language = Language.new(language_params)
    @language.save
    redirect_to @language
  end

  def edit
    @language = Language.find(params[:id])
  end

  def update
    @language = Language.find(params[:id])
    language_params = params.require(:language).permit(:value, :priority)
    @language.update(language_params)
    redirect_to @language
  end

  def show
    @language = Language.find(params[:id])
  end

  def destroy
    @language = Language.find(params[:id])
    @language.destroy
    redirect_to languages_path
  end
end
