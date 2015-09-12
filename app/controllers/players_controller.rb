class PlayersController < ApplicationController
  def index
  end

  def new
    @player = Player.new
  end

  def show
    @player = Player.find(params[:id])
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      flash[:notice] = "Player has been successfully added"
      redirect_to @player
    else
      flash.now[:alert] = "Player has not been added"
      render 'new'
    end
  end

  private
    def player_params
      params.require(:player).permit(:first_name, :last_name)
    end
end
