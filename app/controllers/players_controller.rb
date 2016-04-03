class PlayersController < ApplicationController
  before_action :authenticate_user!, except: [ :index, :show ]

  def index
    @players = Player.all

    if params[:search]
      @players = Player.search(params[:search]).order("created_at DESC")
    else
      @players = Player.all.order('created_at ASC')
    end
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
      flash[:notice] = "Thanks for putting this player on the map!"
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
     params.require(:player).permit(:photo, :first_name, :last_name, :height, :weight, :team_id, :number, :bio, :position_id, :author_id, :league_id, skill_ids: [])
  end

end
