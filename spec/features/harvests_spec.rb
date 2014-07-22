require 'spec_helper'

describe "Harvests" do

  describe "Home page" do

    it "should have the content 'Farm Harvest'" do
      visit '/harvest/home'
      expect(page).to have_content('Farm Harvest')
    end

    it "should have header links to fields page and availability (office) page" do
      visit '/harvest/home'
      expect(page).to have_link('Field', harvest_fields_path)
      expect(page).to have_link('Availability', harvest_availability_path)
    end
  end

  describe "Field entry pages" do
    it "should list crops" do
      visit '/harvest/fields'
      expect(page).to have_content('Strawberries')
      expect(page).to have_content('Broccoli')
      expect(page).to have_content('Early Girl')
    end

    it "should populate crop name on entry form after click" do
      visit '/harvest/fields'
      click_link "Broccoli"
      expect(page).to have_content("Broccoli")
    end

    it "should have entry form" do
      visit '/harvest/field'
      expect(page).to have_content('Crop name')
      expect(page).to have_content('Comments')
      expect(page).to have_content('Quantity')
      expect(page).to have_content('Unit type')
      expect(page).to have_button('Record info')
    end

    it "should enter information into database" do
      visit '/harvest/field'
      fill_in "Crop name", with: "Broccoli"
      fill_in "Quantity", with: "30"
      fill_in "Unit type", with: "ct"
      click_button "Record info"
      expect(Crop.count).to equal(1)
      crop = Crop.find(1)
      expect(crop.name).to eq("Broccoli")
      expect(crop.quantity).to eq(30)
      expect(crop.unit_type).to eq("ct")
      expect(crop.comments).to eq("")
    end

    it "should redirect to fields page with a success message" do
      visit '/harvest/field'
      fill_in "Crop name", with: "Broccoli"
      fill_in "Quantity", with: "30"
      fill_in "Unit type", with: "ct"
      click_button "Record info"
      expect(page).to have_content('Broccoli')
      expect(page).to have_content('Strawberries')
      expect(page).to have_content('Recorded Broccoli')
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
