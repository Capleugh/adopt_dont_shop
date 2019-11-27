require 'rails_helper'

RSpec.describe "shelters show page", type: :feature do
  it "can see shelter's attributes" do
    shelter_1 = Shelter.create(name: "Forever Home Finder",
                               address: "246 Glenwood Dr",
                               city: "Boulder",
                               state: "CO",
                               zip: "80304")

    visit "/shelters/#{shelter_1.id}"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)
  end

  it "when I visit shelter show page, I can click a pet index link which takes me to the pet index" do
    shelter_1 = Shelter.create(name: "Forever Home Finder",
                               address: "246 Glenwood Dr",
                               city: "Boulder",
                               state: "CO",
                               zip: "80304")

    visit "/shelters/#{shelter_1.id}"

    click_link 'Pet Index'   
    expect(current_path).to eq("/pets")
  end
end
