require 'spec_helper'

describe "Harvests" do

  describe "Home page" do

    it "should have the content 'Farm Harvest'" do
      visit '/harvest/home'
      expect(page).to have_content('Farm Harvest')
    end
  end

  describe "Harvest Availability page" do
    it "should have the content 'Farm Harvest Availability'" do
      visit '/harvest/availability'
      expect(page).to have_content('Farm Harvest Availability')
    end

    describe "with results" do
      before do
        @crop = Crop.new(name: "Yellow Carrot, loose", quantity: 20, unit_type: "lbs")
        @crop.save
        @crop = Crop.new(name: "Gold Beet, bunch", comments: "purple and orange in same bunch", quantity: 50,
                         unit_type: "ct")
        @crop.save
      end

      it "should have results" do
        visit '/harvest/availability'
        expect(page).to have_content('Yellow Carrot, loose')
        expect(page).to have_content('20')
        expect(page).to have_content('lbs')
        expect(page).to have_content('Gold Beet, bunch')
        expect(page).to have_content('purple and orange in same bunch')
        expect(page).to have_content('50')
        expect(page).to have_content('ct')
      end

    end

  end

end
