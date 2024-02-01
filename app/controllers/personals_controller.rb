# frozen_string_literal: true

# personal controller : handle personal data
class PersonalsController < ApplicationController
  before_action :set_personal_dropdown_menu, only: %i[new create edit update]
  # before_action :set_personal, only: %i[edit update show]
  before_action :current_personal, only: %i[edit update show]
  before_action :fill_personal, only: %i[new create]
  def new
    @personal = current_user.build_personal
  end

  def create
    @personal = current_user.build_personal(personal_params)
    if @personal.save
      flash[:success] = 'Personal data saved'
      # redirect_to root_url
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
      flash[:success] = 'Personal data updated'
      # redirect_to root_url
    else
      render 'edit'
    end
  end

  private

  def personal_params
    params.require(:personal).permit(:nama_lengkap, :agama, :nik, :nisn, :no_kps, :tanggal_lahir,
                                     :tempat_lahir, :jenis_kelamin, :domisili, :pas_photo)
  end

  def set_personal_dropdown_menu
    @personal_religion = PersonalReligionList.all
    @personal_gender = PersonalGenderList.all
  end

  # def set_personal
  #   @personal = Personal.find(params[:id])
  # end

  def current_personal
    @personal = current_user.personal
    redirect_to root_url if @personal.nil? || @personal.id != params[:id].to_i
  end

  def fill_personal
    @personal = current_user.personal
    redirect_to edit_personal_url @personal if @personal
  end
end
