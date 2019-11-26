require 'rails_helper'

RSpec.describe "Delete Shelter" do
  describe "As a visitior" do
    it "I can delete a shelter" do
      shelter_1 = Shelter.create(name: "Forever Home Finder",
                                 address: "246 Glenwood Dr",
                                 city: "Boulder",
                                 state: "CO",
                                 zip: "80304")

      visit "/shelters/#{shelter_1.id}"

      click_button 'Delete'

      expect(current_path).to eq('/shelters')

      expect(page).to_not have_content(shelter_1.name)
      expect(page).to_not have_content(shelter_1.address)
      expect(page).to_not have_content(shelter_1.city)
      expect(page).to_not have_content(shelter_1.state)
      expect(page).to_not have_content(shelter_1.zip)
    end
  end
end
