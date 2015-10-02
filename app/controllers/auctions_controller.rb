class AuctionsController < ApplicationController
before_action :authenticate_user!, except: [:show, :index]


  def new
    @auction = Auction.new
  end


  def index
    @auction = Auction.all
  end

  def create
    @auction      = Auction.new(auction_params)
    @auction.user = current_user
    if @auction.save
      redirect_to root_path, notice: "Sweet"
    else
      render :new
      flash[:alert] = "Did not create"
    end
  end

  def show
    @auction = Auction.find(params[:id])
    @bid     = Bid.new
  end

  private

  def auction_params
    params.require(:auction).permit(:title, :description, :end_date, :price, :user_id)
  end

end
