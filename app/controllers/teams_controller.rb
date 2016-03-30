class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def show 
    @team = Team.find(params[:id])
  end

  def new 
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)

    if @team.save
      flash[:notice] = "Thanks for adding this team!"
      redirect_to team_path(@team)
    else
      flash.now[:error] = "Something went wrong, please try again!"
      render :new
    end
  end

  def edit 
    @team = Team.find(params[:id])
  end

  def update
    @team = Team.find(params[:id])

    if @team.update(team_params)
      redirect_to team_path(@team), notice: "Team was successfully updated!"
    else
      flash.now[:error] = "An error occurred when updating this team"
      render :edit
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    redirect_to teams_path, notice: "Team was successfully deleted"
  end

  private

  def team_params
   params.require(:team).permit(:name)
 end

end
