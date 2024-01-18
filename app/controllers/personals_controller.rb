class PersonalsController < ApplicationController
  def new
    @personal = current_user.build_personal
  end
  def create
    @personal  = current_user.build_personal(personal_params)
    if @personal.save
      flash[:success] = "Personal data saved"
      #redirect_to root_url
    else
      render 'new'
    end
  end
  def edit
    @personal  = current_user.personal
  end
  def update
    @personal  = current_user.personal
    if @personal.update(personal_params)
      flash[:success] = "Personal data updated"
      #redirect_to root_url
    else
      render 'edit'
    end
  end
  private
    def personal_params
      params.require(:personal).permit(:nama_lengkap, :agama, :nik, :nisn, :no_kps, :tanggal_lahir,
                                       :tempat_lahir, :jenis_kelamin, :domisili)
    end
end
