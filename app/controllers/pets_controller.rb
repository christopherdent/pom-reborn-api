class PetsController < ApplicationController

    def index
        @pets = Pet.all
        render json: @pets
      end

      def show_dogs
        @dogs = Pet.by_species("Dog")
        render json: @dogs
      end

end
