class UtbkScoresController < ApplicationController
  before_action :set_utbk_score, only: %i[edit update show]

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

  def show
  end
  private
  def utbk_score_params
    params.require(:utbk_score).permit(:no_peserta, :tanggal_ujian,
                                       :jumlah_nilai_semester_6,
                                       :jumlah_pelajaran_semester_6,
                                       :nilai_penalaran_umum,
                                       :nilai_pengetahuan_kuantitatif,
                                       :nilai_kemampuan_memahami_bacaan_dan_menulis,
                                       :nilai_pengetahuan_dan_pemahaman_umum, :sertifikat_utbk)
  end
  def set_utbk_score
    @utbk_score = UtbkScore.find(params[:id])
  end
end
