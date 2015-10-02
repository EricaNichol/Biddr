class AuctionsController < ApplicationController

  def new
    @auction = Auction.new
  end

  def index
  end

  def create
    @auction = Auction.new (auction_params)
    if @auction.save
      render nothing: true
    else
      render :new
    end
  end

  private

  def auction_params
    params.require(:auction).permit(:title, :description, :end_date, :price, :user_id)
  end

end
