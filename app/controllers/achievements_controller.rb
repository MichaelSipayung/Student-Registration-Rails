# frozen_string_literal: true

# achievements controller : handle achievements
class AchievementsController < ApplicationController
  before_action :set_achievement_dropdown_menu, only: %i[new create edit update]
  before_action :current_achievement, only: %i[edit show update]
  before_action :non_admin, only: %i[new create edit update]

  def new
    @achievement = current_user.achievements.build
  end

  def update
    @achievement = current_user.achievements.find(params[:id])
    if @achievement.update(achievement_params)
      flash[:success] = 'Achievement success updated'
    else
      render 'edit'
    end
  end

  def create
    @achievement = current_user.achievements.build(achievement_params)
    if @achievement.save
      flash[:success] = 'Achievement success saved'
    else
      render 'new'
    end
  end

  def edit
    @achievement = current_user.achievements.find(params[:id])
  end

  def show; end

  private

  def achievement_params
    params.require(:achievement).permit(:nama_prestasi, :tahun, :tingkat, :kategori)
  end

  def set_achievement_dropdown_menu
    @achievement_tingkat_list = AchievementTingkatList.all
    @achievement_kategori_list = AchievementKategoriList.all
  end

  def set_achievement
    @achievement = Achievement.find(params[:id])
  end

  def current_achievement
    @achievement = current_user.achievements.find_by(id: params[:id])
    redirect_to root_url if @achievement.nil?
  end
end
