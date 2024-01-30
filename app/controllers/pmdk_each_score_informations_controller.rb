class PmdkEachScoreInformationsController < ApplicationController
  def new
    @pmdk_each_score = current_user.build_pmdk_each_score_information
  end

  def update
    @pmdk_each_score = current_user.pmdk_each_score_information
    if @pmdk_each_score.update(pmdk_each_score_information_params)
      flash[:success] = "Pmdk each score information is updated"
    else
      render 'edit'
    end
  end

  def create
    @pmdk_each_score = current_user.build_pmdk_each_score_information(pmdk_each_score_information_params)
    if @pmdk_each_score.save
      flash[:success] = "Pmdk each score information saved"
    else
      render 'new'
    end
  end

  def edit
    @pmdk_each_score = current_user.pmdk_each_score_information
  end

  def show
  end
  private
  def pmdk_each_score_information_params
    params.require(:pmdk_each_score_information).permit(
      :matematika_semester_1, :matematika_semester_2, :matematika_semester_3, :matematika_semester_4,
      :matematika_semester_5, :kimia_semester_1, :kimia_semester_2, :kimia_semester_3, :kimia_semester_4,
      :kimia_semester_5, :fisika_semester_1, :fisika_semester_2, :fisika_semester_3, :fisika_semester_4,
      :fisika_semester_5, :bahasa_inggris_semester_1, :bahasa_inggris_semester_2, :bahasa_inggris_semester_3,
      :bahasa_inggris_semester_4, :bahasa_inggris_semester_5, :sertifikat
    )
  end
end
