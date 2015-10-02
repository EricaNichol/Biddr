require 'rails_helper'

RSpec.describe AuctionsController, type: :controller do

  describe "#new" do
    context "with valid parameters" do
      it "instantiate a new auction model object" do
        get :new
        expect(assigns(:auction)).to be_a_new(Auction)
      end

      it "renders the new template" do
        get :new
        expect(response).to render_template(:new)
      end
    end

  describe "#create" do
    context "with invalid parameters" do
      def valid_params
        {
          title:              "adfb",
          description:        "Stuff",
          price:              12,
          end_on:             12/12/16,
        }
      end

      def valid_request
        post(:create, {auction: valid_params})
      end

      it "adds a auction record to the database" do
        expect { valid_request }.to change { Auction.count }.by(1)
      end
    end
  end
end

end
