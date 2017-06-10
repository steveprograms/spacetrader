class PlanetsController < ApplicationController
	
	def new
		puts params
		@planet = Planet.new
    end

    def create
      @planet = Planet.new(player_params)
	  @planet.save!
	  redirect_to @planet
    end

    def show
      @planet = Planet.find(params[:id])
    end

    private
    def player_params
    	params.require(:planet).permit(:name)
  	end
end
