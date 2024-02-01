# frozen_string_literal: true

#  utbk_score : handle utbk score data
class UtbkScoresController < ApplicationController
  before_action :current_utbk, only: %i[edit update show]
  before_action :fill_utbk, only: %i[new create]
  def new
    @utbk_score = current_user.build_utbk_score
  end

  def update
    @utbk_score = current_user.utbk_score
    if @utbk_score.update(utbk_score_params)
      flash[:success] = ' utbk score is updated'
    else
      render 'edit'
    end
  end

  def create
    @utbk_score = current_user.build_utbk_score(utbk_score_params)
    if @utbk_score.save
      flash[:success] = 'utbk score is saved'
    else
      puts @utbk_score.errors.full_messages
      render 'new'
    end
  end

  def edit
    @utbk_score = current_user.utbk_score
  end

  def show; end

  private

  def utbk_score_params
    params.require(:utbk_score).permit(:no_peserta, :tanggal_ujian,
                                       :jumlah_nilai_semester6,
                                       :jumlah_pelajaran_semester6,
                                       :nilai_penalaran_umum,
                                       :nilai_pengetahuan_kuantitatif,
                                       :nilai_kemampuan_memahami_bacaan_dan_menulis,
                                       :nilai_pengetahuan_dan_pemahaman_umum, :sertifikat_utbk)
  end

  # def set_utbk_score
  #   @utbk_score = UtbkScore.find(params[:id])
  # end

  def current_utbk
    @utbk_score = current_user.utbk_score
    redirect_to root_url if @utbk_score.nil? || @utbk_score.id != params[:id].to_i
  end

  def fill_utbk
    @utbk_score = current_user.utbk_score
    redirect_to edit_utbk_score_url @utbk_score if @utbk_score
  end
end
