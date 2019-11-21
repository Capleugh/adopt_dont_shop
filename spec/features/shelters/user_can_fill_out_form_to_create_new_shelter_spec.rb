require 'rails_helper'

RSpec.describe "New Shelter", type: :feature do
  describe "As a visitor" do
    describe "when I visit the shelter index page" do
      describe "then I see a link to create a new shelter" do
        describe "when I click this link" do
          it "I am taken to /shelters/new where I see a for for a new shelter" do
            visit '/shelters'

            click_link 'New Shelter'

            expect(current_path).to eq('/shelters/new')
          end
        end
      end
    end
  end
end

# Then I see a link to create a new Shelter
# When I click this link
# Then I am taken to '/shelters/new' where I  see a form for a new shelter
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
