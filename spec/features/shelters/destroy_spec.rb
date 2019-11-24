require 'rails_helper'

RSpec.describe "Delete Shelter" do
  describe "As a visitior" do
    it "I can delete a shelter" do
      shelter_3 = Shelter.create(name: "Furever Home Finder",
                                 address: "907 Manhattan Dr",
                                 city: "Dallas",
                                 state: "TX",
                                 zip: "75243")

      visit "/shelters/#{shelter_3.id}"

      click_button 'Delete'

    
      expect(current_path).to eq('/shelters')
      expect(page).to_not have_content(shelter_3.name)
      expect(page).to_not have_content(shelter_3.address)
      expect(page).to_not have_content(shelter_3.city)
      expect(page).to_not have_content(shelter_3.state)
      expect(page).to_not have_content(shelter_3.zip)
    end
  end
end
