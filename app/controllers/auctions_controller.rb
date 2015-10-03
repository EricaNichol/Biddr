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
    respond_to do |format|
      if @auction.save
        format.html { redirect_to root_path, notice: "Sweet" }
        format.json { render :create_success }
      else
        format.html do
          render :new
          flash[:alert] = "Did not create"
      end
        format.js { render :create_failure }
      end
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
