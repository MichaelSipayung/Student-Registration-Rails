# frozen_string_literal: true

# pmdk each score controller : handle pmdk each score
class PmdkEachScoreInformationsController < ApplicationController
  before_action :current_pmdk_each_score, only: %i[show edit update]

  def new
    @pmdk_each_score = current_user.build_pmdk_each_score_information
  end

  def update
    @pmdk_each_score = current_user.pmdk_each_score_information
    if @pmdk_each_score.update(pmdk_each_score_information_params)
      flash[:success] = 'Pmdk each score information is updated'
    else
      render 'edit'
    end
  end

  def create
    @pmdk_each_score = current_user.build_pmdk_each_score_information(pmdk_each_score_information_params)
    if @pmdk_each_score.save
      flash[:success] = 'Pmdk each score information saved'
    else
      render 'new'
    end
  end

  def edit
    @pmdk_each_score = current_user.pmdk_each_score_information
  end

  def show; end

  private

  def pmdk_each_score_information_params
    params.require(:pmdk_each_score_information).permit(
      :matematika_semester1, :matematika_semester2, :matematika_semester3, :matematika_semester4,
      :matematika5, :kimia1, :kimia2, :kimia3, :kimia4,
      :kimia5, :fisika1, :fisika2, :fisika3, :fisika4,
      :fisika5, :inggris1, :inggris2, :inggris3,
      :inggris4, :inggris5, :sertifikat
    )
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_pmdk_each_score
    @pmdk_each_score = PmdkEachScoreInformation.find(params[:id])
  end

  def current_pmdk_each_score
    @pmdk_each_score = current_user.pmdk_each_score_information
    redirect_to root_url if @pmdk_each_score.nil? || @pmdk_each_score.id != params[:id].to_i
  end
end
