class PetsController < ApplicationController
  def index
    # require "pry"; binding.pry
    if params[:shelter_id]
      @shelter = Shelter.find(params[:shelter_id])
      @pets = @shelter.pets
    else
      @pets = Pet.all
    # come back and revisit this to make sure you fully comprehend it
    end
  end

  def show
    # require "pry"; binding.pry
    @pet = Pet.find(params[:id])
  end
end
