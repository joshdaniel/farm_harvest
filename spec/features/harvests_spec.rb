require 'spec_helper'

describe "Harvests" do

  describe "Home page" do

    it "should have the content 'Farm Harvest'" do
      visit '/harvest/home'
      expect(page).to have_content('Farm Harvest')
    end
    end
end
