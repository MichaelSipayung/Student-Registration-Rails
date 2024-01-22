class MajorsController < ApplicationController
  def new
    @major = current_user.build_major
  end

  def update
    @major = current_user.major
    if @major.update(major_params)
      flash[:success] = "Major updated"
    else
      render 'edit'
    end
  end

  def create
    @major = current_user.build_major(major_params)
    if @major.save
      flash[:success] = "Major saved"
    else
      render 'new'
    end
  end

  def edit
    @major = current_user.major
  end

  def show
  end
  private
  def major_params
    params.require(:major).permit(:jurusan_1, :jurusan_2, :jurusan_3, :gelombang)
  end
end
