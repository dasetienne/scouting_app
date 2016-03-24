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
      flash[:notice] = "Thanks for putting #{player} on the map!"
      redirect_to character_path(@character)
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

    if @character.update(character_params)
      redirect_to character_path(@character), notice: "Player was successfully updated!"
    else
      flash.now[:error] = "An error occurred when updating this player"
      render :edit
    end
  end

  def destroy
    @character = Character.find(params[:id])
    @character.destroy

    redirect_to characters_path, notice: "Character was successfully deleted"
  end

  private

  def character_params
   params.require(:character).permit(:first_name, :last_name, :height, :weight, :team, :number, :bio)
 end

end
