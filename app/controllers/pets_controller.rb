class PetsController < ApplicationController

  ##Crud Actions
    def create
      @pet = Pet.new(pet_params)
      if @pet.save
        render json: @pet, status: :created
      else
        render json: @pet.errors, status: :unprocessable_entity
      end
    end

    def index
      @pets = Pet.all
      render json: @pets
    end

    def show
      @pet = Pet.find(params[:id])
      render json: @pet
    end

    def update
      @pet = Pet.find(params[:id])
      if @pet.update(pet_params)
        render json: @pet
      else
        render json: @pet.errors, status: :unprocessable_entity
      end
    end

    def destroy
      @pet = Pet.find(params[:id])
      @pet.destroy
    end

     def show_dogs
      @dogs = Pet.by_species("Dog")
      render json: @dogs
    end

    private

    def pet_params
      params.require(:pet).permit(
        :name,
        :age,
        :owner,
        :species,
        :gender,
        :color,
        :date_of_birth,
        :health_score,
        :personality_traits,
        :pet_status,
        :bio,
        :weight
      )
    end
    

end
