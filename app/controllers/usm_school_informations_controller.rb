class UsmSchoolInformationsController < ApplicationController
  before_action :set_usm_school_dropdown, only: [:new, :create, :edit, :update]
  before_action :set_usm_school, only: %i[edit update show]

  def new
    @usm_school = current_user.build_usm_school_information
  end

  def update
    @usm_school = current_user.usm_school_information
    if @usm_school.update(usm_school_information_params)
      flash[:success] = 'usm school information is updated'
    else
      # puts @usm_school.errors.full_messages
      render 'edit'
    end
  end

  def create
    @usm_school = current_user.build_usm_school_information(usm_school_information_params)
    if @usm_school.save
      flash[:success] = 'usm school information is saved'
    else
      render 'new'
    end
  end

  def edit
    @usm_school = current_user.usm_school_information
  end

  def show
  end
  private
    def usm_school_information_params
      params.require(:usm_school_information).permit(
      :jurusan_sekolah, :asal_sekolah, :akreditas, :jumlah_nilai_un,
      :jumlah_pelajaran_un, :jumlah_pelajaran_semester_5, :jumlah_nilai_semester_5
      )
    end
    def set_usm_school_dropdown
      @accreditation = AccreditationSchoolList.all
      @high_school_major = HighSchoolMajor.all
    end
  def set_usm_school
    @usm_school = UsmSchoolInformation.find(params[:id])
  end
end
