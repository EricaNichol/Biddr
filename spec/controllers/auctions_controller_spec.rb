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
    context "with valid parameters" do

      def valid_params
        {
          title:              "adfb",
          description:        "Stuff",
          price:              10,
          end_date:           12/12/16,
        }
      end

      def valid_request
        post(:create, {auction: valid_params})
      end

      it "adds a auction record to the database" do
        expect { valid_request }.to change { Auction.count }.by(1)
      end

      it "redirects to the homepage" do
        valid_request
        expect(response).to redirect_to root_path
      end

      it "sets a flash message" do
        valid_request
        expect(flash[:notice]).to be
      end
    end

    context "with invalid parameters" do
      def invalid_params
        {
          title:          "",
          description:    "",
          price:           12,
          end_date:         ""
        }
      end

      def invalid_request
        post(:create, {auction: invalid_params})
      end

      it "doesn't create a record in the database" do
        expect { invalid_request }.not_to change { Auction.count }
      end

      it "render the new template" do
        invalid_request
        expect(response).to render_template(:new)
      end

      it "sets a flash message" do
        invalid_request
        expect(flash[:alert]).to be
      end
    end
  end

end

end
