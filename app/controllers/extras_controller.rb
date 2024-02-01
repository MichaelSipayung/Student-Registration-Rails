# frozen_string_literal: true

# extra controller : handle extra
class ExtrasController < ApplicationController
  before_action :set_extra_dropdown_menu, only: %i[new create edit update]
  before_action :current_extra, only: %i[edit show update]
  def new
    @extra = current_user.extras.build
  end

  def update
    @extra = current_user.extras.find(params[:id])
    if @extra.update(extra_params)
      flash[:success] = 'Extra activity updated'
    else
      render 'edit'
    end
  end

  def create
    @extra = current_user.extras.build(extra_params)
    if @extra.save
      flash[:success] = 'Extra activity created'
    else
      render 'new'
    end
  end

  def edit
    @extra = current_user.extras.find(params[:id])
  end

  def show; end

  private

  def extra_params
    params.require(:extra).permit(:nama_kegiatan, :mulai, :berakhir, :predikat)
  end

  def set_extra_dropdown_menu
    @extra_list = ExtraList.all
  end

  def set_extra
    @extra = Extra.find(params[:id])
  end

  def current_extra
    @extra = current_user.extras.find_by(id: params[:id])
    redirect_to root_url if @extra.nil?
  end
end
