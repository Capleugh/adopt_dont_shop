require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I visit the pets index page" do
    it "I see each pet in the system and all of their info" do
      shelter_1 = Shelter.create!(name: "Furever Home Finder",
                                 address: "907 Manhattan Dr",
                                 city: "Dallas",
                                 state: "TX",
                                 zip: "75243")
      shelter_2 = Shelter.create!(name: "Denver Cat Company",
                                 address: "3929 Tennyson St",
                                 city: "Denver",
                                 state: "CO",
                                 zip: "80212")
      pet_1 = shelter_1.pets.create!(image: "https://s3.amazonaws.com/playbarkrun/wp-content/uploads/2018/05/11154028/1920px-V%C3%A4stg%C3%B6taspets_hane_5_%C3%A5r.jpg",
                                     name: 'Stanislaus',
                                     approximate_age: 5,
                                     sex: 'female')
      pet_2 = shelter_2.pets.create!(image: 'https://i.pinimg.com/originals/f8/27/ed/f827ed9a704146f65b96226f430abf3c.png',
                                     name: 'Smudge',
                                     approximate_age: 3,
                                     sex: 'male')

      visit '/pets'

      expect(page).to have_content(pet_1.name)
      expect(page).to have_content(pet_1.approximate_age)
      expect(page).to have_content(pet_1.sex)
      expect(page).to have_content(pet_1.shelter.name)
      expect(page).to have_css("img[src*='#{pet_1.image}']")

      expect(page).to have_content(pet_2.name)
      expect(page).to have_content(pet_2.approximate_age)
      expect(page).to have_content(pet_2.sex)
      expect(page).to have_content(pet_2.shelter.name)
      expect(page).to have_css("img[src*='#{pet_2.image}']")
      # come back and pick this apart. Why does this work?
    end
  end
end
