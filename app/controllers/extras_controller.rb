class ExtrasController < ApplicationController
  def new
    @extra = current_user.extras.build
  end

  def update
    @extra  = current_user.extras.find(params[:id])
    if @extra.update(extra_params)
      flash[:success] = "Extra activity updated"
    else
      render 'edit'
    end
  end

  def create
    @extra  = current_user.extras.build(extra_params)
    if @extra.save
      flash[:success] = "Extra activity created"
    else
      render 'new'
    end
  end

  def edit
    @extra  = current_user.extras.find(params[:id])
  end

  def show
  end
  private
  def extra_params
    params.require(:extra).permit(:nama_kegiatan, :mulai, :berakhir, :predikat)
  end
end
