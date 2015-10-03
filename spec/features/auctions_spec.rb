require 'rails_helper'

RSpec.feature "Auctions", type: :feature do

  describe "Home Page" do
    it "displays a welcome message" do
      visit root_path
      expect(page).to have_text "Welcome"
    end
  end
end
