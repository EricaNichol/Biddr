class BidsController < ApplicationController

  def create
    @bid    = Bid.new(bid_params)
  end

  private

  def bid_params
    params.require(:bid).permit(:amount)
  end

end
