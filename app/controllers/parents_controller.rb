class ParentsController < ApplicationController
  def new
    @parent  = current_user.build_parent
  end

  def update
    @parent  = current_user.parent
    if @parent.update(parent_params)
      flash[:success] = "Parent data updated"
    else
      render 'edit'
    end
  end

  def create
    @parent  = current_user.build_parent(parent_params)
    if @parent.save
      flash[:success] = "Parent data saved"
    else
      render 'new'
    end
  end

  def edit
    @parent = current_user.parent
  end

  def show
  end
  private
    def parent_params
      params.require(:parent).permit(:nama_ayah, :nama_ibu, :nik_ayah,:nik_ibu, :pendidikan_ayah,
                                     :pendidikan_ibu, :tanggal_lahir_ayah, :tanggal_lahir_ibu,
                                     :pekerjaan_ayah, :pekerjaan_ibu)
    end
end
