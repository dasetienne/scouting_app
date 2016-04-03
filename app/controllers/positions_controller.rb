class PositionsController < ApplicationController
    def index
    @positions = Position.all
  end

  def show 
    @position = Position.find(params[:id])
     @players = @position.players.order(created_at: :desc)
  end

  def new 
    @position = Position.new
  end

  def create
    @position = Position.new(position_params)

    if @position.save
      flash[:notice] = "Thanks for adding this position!"
      redirect_to position_path(@position)
    else
      flash.now[:error] = "Something went wrong, please try again!"
      render :new
    end
  end

  def edit 
    @position = Position.find(params[:id])
  end

  def update
    @position = Position.find(params[:id])

    if @position.update(position_params)
      redirect_to position_path(@position), notice: "Position was successfully updated!"
    else
      flash.now[:error] = "An error occurred when updating this position"
      render :edit
    end
  end

  def destroy
    @position = Position.find(params[:id])
    @position.destroy

    redirect_to positions_path, notice: "Position was successfully deleted"
  end

  private

  def position_params
   params.require(:position).permit(:name)
 end
end
