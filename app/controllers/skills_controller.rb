class SkillsController < ApplicationController

  def index
    @skills = Skill.all
  end

  def show 
    @skill = Skill.find(params[:id])
  end

  def new 
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)

    if @skill.save
      flash[:notice] = "Skill has been added!"
      redirect_to skill_path(@skill)
    else
      flash.now[:error] = "Something went wrong, please try again!"
      render :new
    end
  end

  def edit 
    @skill = Skill.find(params[:id])
  end

  def update
    @skill = Skill.find(params[:id])

    if @skill.update(skill_params)
      redirect_to skill_path(@skill), notice: "Skill was successfully updated!"
    else
      flash.now[:error] = "An error occurred when updating this skill"
      render :edit
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy

    redirect_to skills_path, notice: "Skill was successfully deleted"
  end

  private

  def skill_params
   params.require(:skill).permit(:name)

end

end
