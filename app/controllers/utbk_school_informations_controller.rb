class UtbkSchoolInformationsController < ApplicationController
  def new
    @utbk_school_information = current_user.build_utbk_school_information
  end

  def update
    @utbk_school_information = current_user.utbk_school_information
    if @utbk_school_information.update(utbk_school_information_params)
      flash[:success] = "UTBK School information saved"
    else
      render 'edit'
    end
  end

  def create
    @utbk_school_information = current_user.build_utbk_school_information(utbk_school_information_params)
    if @utbk_school_information.save
      flash[:success] = "UTBK School information is saved"
    else
      render 'new'
    end
  end

  def edit
    @utbk_school_information = current_user.utbk_school_information
  end

  def show
  end
  private
  def utbk_school_information_params
    params.require(:utbk_school_information).permit(:asal_sekolah, :akreditas, :jurusan_sekolah,
                                                    :jumlah_pelajaran_un,
                                                    :jumlah_nilai_un)
  end
end
