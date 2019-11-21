require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see the name of all shelters" do
    shelter_1 = Shelter.create(name: "Forever Home Finder",
                               address: "246 Glenwood Dr",
                               city: "Boulder",
                               state: "CO",
                               zip: "80304")
    shelter_2 = Shelter.create(name: "Rescuers Up Over",
                               address: "905 Manhattan Dr",
                               city: "Boulder",
                               state: "CO",
                               zip: "80303")

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end
end
