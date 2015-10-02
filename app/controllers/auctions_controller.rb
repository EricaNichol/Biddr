class AuctionsController < ApplicationController

  def new
    @auction = Auction.new
  end

  def index
  end

  def create
    @auction = Auction.new (auction_params)
    if @auction.save
      redirect_to root_path, notice: "Sweet"
    else
      render :new
      flash[:alert] = "Did not create"
    end
  end

  private

  def auction_params
    params.require(:auction).permit(:title, :description, :end_date, :price, :user_id)
  end

end
