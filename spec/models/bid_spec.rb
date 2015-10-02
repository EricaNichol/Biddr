require 'rails_helper'

RSpec.describe Bid, type: :model do

def bid_attributes
  {
    amount: 10
  }
end

  describe "Validations" do
    it "requires a price" do
      bid = Bid.new bid_attributes
      expect(bid).to be_invalid
    end
  end
end
