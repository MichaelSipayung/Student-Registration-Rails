class AchievementsController < ApplicationController
  def new
    @achievement = current_user.achievements.build
  end

  def update
    @achievement = current_user.achievements.find(params[:id])
    if @achievement.update(achievement_params)
      flash[:success] = "Achievement success updated"
    else
      render 'edit'
    end
  end

  def create
    @achievement = current_user.achievements.build(achievement_params)
    if @achievement.save
      flash[:success] = "Achievement success saved"
    else
      render 'new'
    end
  end

  def edit
    @achievement  = current_user.achievements.find(params[:id])
  end

  def show
  end
  private
    def achievement_params
      params.require(:achievement).permit(:nama_prestasi, :tahun, :tingkat, :kategori)
    end
end
