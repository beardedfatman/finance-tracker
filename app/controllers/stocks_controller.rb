class StocksController < ApplicationController
  
  def search
    if params[:stock].blank?
      flash.now[:danger] = "You have entered an empty search"
    else
      @stock = Stock.new_from_lookup(params[:stock])
      flash.now[:danger] = "You have entered an incorrect ticker" unless @stock
    end
    render partial: "users/result"
  end
  
  def stock_already_added?(ticker_symbol)
    stock = Stock.find_by_ticker(ticker_symbol)
  end
  
end