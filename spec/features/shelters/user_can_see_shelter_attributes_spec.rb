require 'rails_helper'

RSpec.describe "shelters show page", type: :feature do
  it "can see shelter's attributes" do
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

    visit "/shelters/:id"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)
    expect(page).to have_content(shelter_2.name)
    expect(page).to have_content(shelter_2.address)
    expect(page).to have_content(shelter_2.city)
    expect(page).to have_content(shelter_2.state)
    expect(page).to have_content(shelter_2.zip)
  end
end
