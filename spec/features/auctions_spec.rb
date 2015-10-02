require 'rails_helper'

RSpec.feature "Auctions", type: :feature do
  describe "Home Page" do
    visit root_path
    expect(page).to have_text "Welcome"
  end
end
