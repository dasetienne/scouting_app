class LeaguesController < ApplicationController

  def index
    @leagues = League.all
  end

  def show 
    @league = League.find(params[:id])
     @players = @league.players.order(created_at: :desc)
  end

  def new 
    @league = League.new
  end

  def create
    @league = League.new(league_params)

    if @league.save
      flash[:notice] = "Thanks for adding this league!"
      redirect_to league_path(@league)
    else
      flash.now[:error] = "Something went wrong, please try again!"
      render :new
    end
  end

  def edit 
    @league = League.find(params[:id])
  end

  def update
    @league = League.find(params[:id])

    if @league.update(league_params)
      redirect_to league_path(@league), notice: "League was successfully updated!"
    else
      flash.now[:error] = "An error occurred when updating this league"
      render :edit
    end
  end

  def destroy
    @league = League.find(params[:id])
    @league.destroy

    redirect_to leagues_path, notice: "League was successfully deleted"
  end

  private

  def league_params
   params.require(:league).permit(:name)
 end

end
