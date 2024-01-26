class PmdkSchoolInformationsController < ApplicationController
  def new
    @pmdk_school_information  = current_user.build_pmdk_school_information
  end

  def update
    @pmdk_school_information  = current_user.pmdk_school_information
    if @pmdk_school_information.update(pmdk_school_information_params)
      flash[:success] = "pmdk school information updated"
    else
      render 'edit'
    end
  end

  def create
    @pmdk_school_information  = current_user.build_pmdk_school_information(pmdk_school_information_params)
    if @pmdk_school_information.save
      flash[:success] = "pmdk schoool information saved"
    else
      render 'new'
    end
  end

  def edit
    @pmdk_school_information  = current_user.pmdk_school_information
  end

  def show
  end
  private
  def pmdk_school_information_params
    params.require(:pmdk_school_information).permit(:asal_sekolah,
                                                    :akreditas,
                                                    :jumlah_pelajaran_un,
                                                    :jumlah_nilai_un)
  end
end
