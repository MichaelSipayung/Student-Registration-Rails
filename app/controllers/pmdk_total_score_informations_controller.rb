# frozen_string_literal: true

# pmdk total score controller : handle pmdk total score
class PmdkTotalScoreInformationsController < ApplicationController
  before_action :current_pmdk_total_score, only: %i[edit update show]
  def new
    @pmdk_total_score = current_user.build_pmdk_total_score_information
  end

  def update
    @pmdk_total_score = current_user.pmdk_total_score_information
    if @pmdk_total_score.update(pmdk_total_score_params)
      flash[:success] = 'Pmdk total score is updated'
    else
      render 'edit'
    end
  end

  def create
    @pmdk_total_score = current_user.build_pmdk_total_score_information(pmdk_total_score_params)
    if @pmdk_total_score.save
      flash[:success] = 'Pmdk total score information is saved'
    else
      render 'new'
    end
  end

  def edit
    @pmdk_total_score = current_user.pmdk_total_score_information
  end

  def show; end

  private

  def pmdk_total_score_params
    params.require(:pmdk_total_score_information).permit(
      :jumlah_nilai_semester1, :jumlah_nilai_semester2, :jumlah_nilai_semester3,
      :jumlah_nilai_semester4, :jumlah_nilai_semester5,
      :jumlah_pelajaran_semester1, :jumlah_pelajaran_semester2,
      :jumlah_pelajaran_semester3, :jumlah_pelajaran_semester4, :jumlah_pelajaran_semester5,
      :surat_rekomendasi
    )
  end

  # def set_pmdk_total_score
  #   @pmdk_total_score = PmdkTotalScoreInformation.find(params[:id])
  # end

  def current_pmdk_total_score
    @pmdk_total_score = current_user.pmdk_total_score_information
    redirect_to root_url if @pmdk_total_score.nil? || @pmdk_total_score.id != params[:id].to_i
  end
end
