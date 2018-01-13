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
    puts "HITTING CONTROLLER"
    item = params[:item]
    item = item[0, item.length - 6]
    price =  params[:price]
    player = Player.find(params[:player_id])
    player.buy_item(item, price)
    respond_to do |format|
      format.js 
    end
  end

  private
  def player_params
  	params.require(:player).permit(:name)
	end
end
