class Bid < ActiveRecord::Base
  # validate :cannot_bid_on_self

  # def cannot_bid_on_self
  #   current_user == auction.user_id
  #   flash[:alert] = "Cant bid on self auction"
  # end

  belongs_to :auction

  validates :amount, presence: true,
                     numericality: { greater_than_or_equal_to: 1 }


end
