class Bidding < ActiveRecord::Base
  belongs_to :bid
  belongs_to :auction
end
