require 'rails_helper'

RSpec.describe "As a visitor" do
  it "I can click a link on the shelter pets index page and fill out a form to create a new pet" do
      shelter_1 = Shelter.create!(name: "New Shelter",
                                 address: "908 Beltline Dr",
                                 city: "Richardson",
                                 state: "TX",
                                 zip: "75081")

      visit "/shelters/#{shelter_1.id}/pets"


      click_link 'New Pet'
      expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")

      image = 'https://i.pinimg.com/originals/f8/27/ed/f827ed9a704146f65b96226f430abf3c.png'
      name = 'Smudge'
      description = 'Very memeable. Hates vegetals.'
      approximate_age = 4
      sex = 'male'

      fill_in 'Image', with: image
      fill_in 'Name', with: name
      fill_in 'Description', with: description
      fill_in 'Approximate age', with: approximate_age
      fill_in 'Sex', with: sex

      
      click_button 'Add pet'
      expect(current_path).to eq("shelters/#{shelter_1.id}/pets")

      expect(page).to have_css("img[src*='#{image}']")
      expect(page).to have_content(name)
      expect(page).to have_content(description)
      expect(page).to have_content(approximate_age)
      expect(page).to have_content(sex)
  end
end
