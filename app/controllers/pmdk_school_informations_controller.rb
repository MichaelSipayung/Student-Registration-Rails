# frozen_string_literal: true

# pmdk school information controller : handle pmdk school information
class PmdkSchoolInformationsController < ApplicationController
  before_action :set_pmdk_school_dropdown, only: %i[new create edit update]
  before_action :current_pmdk_school, only: %i[edit update show]
  before_action  :fill_pmdk_school, only: %i[new create]
  before_action :non_admin, only: %i[new create edit update]

  def new
    @pmdk_school_information  = current_user.build_pmdk_school_information
  end

  def update
    @pmdk_school_information  = current_user.pmdk_school_information
    if @pmdk_school_information.update(pmdk_school_information_params)
      flash[:success] = 'pmdk school information updated'
    else
      render 'edit'
    end
  end

  def create
    @pmdk_school_information = current_user.build_pmdk_school_information(pmdk_school_information_params)
    if @pmdk_school_information.save
      flash[:success] = 'pmdk schoool information saved'
    else
      render 'new'
    end
  end

  def edit
    @pmdk_school_information = current_user.pmdk_school_information
  end

  def show; end

  private

  def pmdk_school_information_params
    params.require(:pmdk_school_information).permit(:asal_sekolah, :jurusan_sekolah,
                                                    :akreditas,
                                                    :jumlah_pelajaran_un,
                                                    :jumlah_nilai_un, :nilai_rapor)
  end

  def set_pmdk_school_dropdown
    @accreditation = AccreditationSchoolList.all
    @high_school_major = HighSchoolMajor.all
  end

  def set_pmdk_school
    @pmdk_school_information = PmdkSchoolInformation.find(params[:id])
  end

  def current_pmdk_school
    @pmdk_school_information = current_user.pmdk_school_information
    redirect_to root_url if @pmdk_school_information.nil? ||
                            @pmdk_school_information.id != params[:id].to_i
  end

  def fill_pmdk_school
    @pmdk_school_information = current_user.pmdk_school_information
    redirect_to edit_pmdk_school_information_url @pmdk_school_information if @pmdk_school_information
  end
end
