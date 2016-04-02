class CommentsController < ApplicationController
  def create
    @player = Player.find(params[:player_id])
    @comment = @player.comments.create(params[:comment].permit(:name, :body))

    redirect_to player_path(@player)
  end

  def destroy
    @player = Player.find(params[:player_id])
    @comment = @player.comments.find(params[:id])
    @comment.destroy

    redirect_to player_path(@player)


  end
end
