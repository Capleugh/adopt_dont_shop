require 'rails_helper'

RSpec.describe "New Shelter", type: :feature do
  describe "As a visitor" do
    describe "when I visit the new shelter form by clicking on the new shelter link on the index page" do
      it "creates a new shelter" do

        visit '/shelters'

        click_link 'New Shelter'

        expect(current_path).to eq('/shelters/new')

        fill_in 'Name', with: 'Humane Society'
        fill_in 'Address', with: '547 Iris Ave'
        fill_in 'City', with: 'Boulder'
        fill_in 'State', with: 'CO'
        fill_in 'Zip', with: '80304'
        click_on 'Create Shelter'

        expect(current_path).to eq('/shelters')

        expect(page).to have_content('Humane Society')
        expect(page).to have_content('547 Iris Ave')
        expect(page).to have_content('Boulder')
        expect(page).to have_content('CO')
        expect(page).to have_content('80304')
        # save_and_open_page
      end
    end
  end
end

#
# When I fill out the form with a new shelter's:
# - name
# - address
# - city
# - state
# - zip
# And I click the button to submit the form
# Then a `POST` request is sent to '/shelters',
# a new shelter is created,
# and I am redirected to the Shelter Index page where I see the new Shelter listed.
