# frozen_string_literal: true

# major controller : handle major
class MajorsController < ApplicationController
  before_action :set_major_dropdown_menu, only: %i[new create edit update]
  before_action :current_user, only: %i[edit update show]
  before_action :fill_major, only: %i[new create]
  before_action :non_admin, only: %i[new create edit update]

  def new
    @major = current_user.build_major
  end

  def update
    @major = current_user.major
    if @major.update(major_params)
      flash[:success] = 'Major updated'
    else
      render 'edit'
    end
  end

  def create
    @major = current_user.build_major(major_params)
    if @major.save
      flash[:success] = 'Major saved'
    else
      render 'new'
    end
  end

  def edit
    @major = current_user.major
  end

  def show; end

  private

  def major_params
    params.require(:major).permit(:jurusan1, :jurusan2, :jurusan3, :gelombang)
  end

  def set_major_dropdown_menu
    @major_list = MajorList.all
    @batch_list = BatchList.all
  end

  def set_major
    @major = Major.find(params[:id])
  end

  def current_major
    @major = current_user.major
    redirect_to root_url if @major.nil? || @major.id != params[:id].to_i
  end

  def fill_major
    @major = current_user.major
    redirect_to edit_major_url @major if @major
  end
end
