require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see the name all of each shelter" do
    shelter_1 = Shelter.create(name: "Forever Home Finder")
    shelter_2 = Shelter.create(name: "Rescuers Up Over")

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end
end
