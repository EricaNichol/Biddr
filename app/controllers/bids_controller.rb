class BidsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def create
    @bid         = Bid.new(bid_params)
    @auction     = Auction.find params[:auction_id]
    @bid.auction = @auction
    respond_to do |format|
      if @bid.save
        format.html { redirect_to auction_path(@auction), notice: "good job" }
        format.js { render :create_success }
      else
        render "/auctions/show"
      end
    end
  end

  def destroy
    @bid        = Bid.find params[:id]
    @auctions   = Auction.find params[:auction_id]
    @bid.destroy
    respond_to do |format|
      format.html { redirect_to auction_path(@auction), notice: "deleted" }
      format.js { render }
    end
  end


  private

  def bid_params
    params.require(:bid).permit(:amount, :auction_id)
  end

end
