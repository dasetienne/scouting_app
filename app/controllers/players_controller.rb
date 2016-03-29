class PlayersController < ApplicationController

  def index
    @players = Player.all
  end

  def show 
    @player = Player.find(params[:id])
  end

  def new 
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      flash[:notice] = "Thanks for putting this guy on the map!"
      redirect_to player_path(@player)
    else
      flash.now[:error] = "Aww... Something went wrong, please try again!"
      render :new
    end
  end

  def edit 
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])

    if @player.update(player_params)
      redirect_to player_path(@player), notice: "Player was successfully updated!"
    else
      flash.now[:error] = "An error occurred when updating this player"
      render :edit
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy

    redirect_to players_path, notice: "Player was successfully deleted"
  end

  private

  def player_params
   params.require(:player).permit(:first_name, :last_name, :height, :weight, :team, :number, :bio, :position, :author_id, ability_ids: [])
 end

end
