require 'rails_helper'

RSpec.describe AuctionsController, type: :controller do
  let(:auction)   { FactoryGirl.create(:auction)    }
  let(:user)      { FactoryGirl.create(:user)       }

  describe "#new" do
    context "user not signed in" do
      it "redirect to login page" do

        get :new
        expect(response).to redirect_to new_session_path
      end
    end

    context "user signed in" do
      let(:user)    { FactoryGirl.create(:user)       }

      it "renders the new auction template" do
        session[:user_id] = user.id
        get :new
        expect(response).to render_template(:new)
      end

      it "instantiates a new auction object" do
        session[:user_id] = user.id
        get :new
        expect(assigns(:auction)).to be_a_new(Auction)
      end
    end

  describe "#create" do
    context "with not signed in" do
      it "redirects to sign in page" do
        post :create
        expect(response).to redirect_to new_session_path
      end
    end

    context "with user signed in" do

      context "with valid parameters" do
      let(:user)      { FactoryGirl.create(:user)     }
      let(:auction)   { FactoryGirl.create(:auction)   }
      #
      # def valid_request
      #   post :create, auction: attributes_for(:auction)
      # end

      it "creates a campaign in the database" do
        session[:user_id] = user.id
        expect { :auction }.to change { Auction.count }.by(1)
      end

      it "sets a flash message" do
        session[:user_id] = user.id
        valid_request
        expect(flash[:notice]).to be
      end
      end
    end

  end

end

end
