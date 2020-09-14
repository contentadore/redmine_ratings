class CurrenciesController < ApplicationController
  def index
    @currencies = Currency.all
  end

  def new
    @currency = Currency.new
  end

  def create
    currency_params = params.require(:currency).permit(:value)
    @currency = Currency.new(currency_params)
    @currency.save
    redirect_to @currency
  end

  def edit
    @currency = Currency.find(params[:id])
  end

  def update
    @currency = Currency.find(params[:id])
    currency_params = params.require(:currency).permit(:value)
    @currency.update(currency_params)
    redirect_to @currency
  end

  def show
    @currency = Currency.find(params[:id])
  end

  def destroy
    @currency = Currency.find(params[:id])
    @currency.destroy
    redirect_to currencies_path
  end
end
