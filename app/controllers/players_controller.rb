class PlayersController < ApplicationController
	
	def new
		puts params
		@player = Player.new
    end

    def create
      @player = Player.new(player_params)
	  @player.save!
	  redirect_to @player
    end

    def show
      @player = Player.find(params[:id])
    end

    private
    def player_params
    	params.require(:player).permit(:name)
  	end
end
