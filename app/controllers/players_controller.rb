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

  def buy
    puts "BUY BUY BUY"
    item = params[:item]
    puts item
    buy(item)
  end

  private
  def player_params
  	params.require(:player).permit(:name)
	end
end
