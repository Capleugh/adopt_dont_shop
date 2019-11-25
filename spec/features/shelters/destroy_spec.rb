require 'rails_helper'

RSpec.describe "Delete Shelter" do
  describe "As a visitior" do
    it "I can delete a shelter" do
      shelter_1 = Shelter.create(name: "Furever Home Finder",
                                 address: "907 Manhattan Dr",
                                 city: "Dallas",
                                 state: "TX",
                                 zip: "75243")

      visit "/shelters/#{shelter_1.id}"
      save_and_open_page
require "pry"; binding.pry
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
