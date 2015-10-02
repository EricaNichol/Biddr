class BidsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def create
    @bid         = Bid.new(bid_params)
    @auction     = Auction.find params[:auction_id]
    @bid.auction = @auction
    if @bid.save
    redirect_to auction_path(@auction), notice: "good job"
    else
      render "/auctions/show"
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:amount, :auction_id)
  end

end
