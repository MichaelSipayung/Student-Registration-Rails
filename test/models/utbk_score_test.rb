require "test_helper"

class UtbkScoreTest < ActiveSupport::TestCase
  def setup
    @score_utbk = UtbkScore.new(user_id: users(:michael).id, no_peserta: '200-1bx', tanggal_ujian: '2020-12-11',
                                jumlah_nilai_semester_6: 1200.5, jumlah_pelajaran_semester_6: 11,
                                nilai_penalaran_umum: 120.5,
                                nilai_pengetahuan_kuantitatif: 150.5,
                                nilai_kemampuan_memahami_bacaan_dan_menulis: 300.5,
                                nilai_pengetahuan_dan_pemahaman_umum: 250.5)
  end
  test "should valid utbk score" do
    assert @score_utbk.valid?
  end
  test "should reject invalid no_peserta" do
    @score_utbk.no_peserta =' '
    assert_not @score_utbk.valid?
    @score_utbk.no_peserta = 'a'*3
    assert_not @score_utbk.valid?
    @score_utbk.no_peserta = 'a' * 31
    assert_not @score_utbk.valid?
  end
  test "should reject invalid tanggal" do
    @score_utbk.tanggal_ujian = ' '
    assert_not @score_utbk.valid?
    @score_utbk.tanggal_ujian = '20000-290-90'
    assert_not @score_utbk.valid?
    @score_utbk.tanggal_ujian = '201'
    assert_not @score_utbk.valid?
  end
  test "should reject invalid jumlah_nilai_semester_6" do
    @score_utbk.jumlah_nilai_semester_6 = -12
    assert_not @score_utbk.valid?
    @score_utbk.jumlah_nilai_semester_6 = 3000
    assert_not @score_utbk.valid?
    @score_utbk.jumlah_nilai_semester_6 = 'abs'
    assert_not @score_utbk.valid?
  end
  test "should reject for invalid jumlah pelajaran semester 6" do
    @score_utbk.jumlah_pelajaran_semester_6 = -1
    assert_not @score_utbk.valid?
    @score_utbk.jumlah_pelajaran_semester_6 = 101
    assert_not @score_utbk.valid?
    @score_utbk.jumlah_pelajaran_semester_6 = 'abs'
    assert_not @score_utbk.valid?
  end
  test "should reject for invalid nilai_penalaran_umum " do
    @score_utbk.nilai_penalaran_umum = -1
    assert_not @score_utbk.valid?
    @score_utbk.nilai_penalaran_umum = 2001
    assert_not @score_utbk.valid?
    @score_utbk.nilai_penalaran_umum = 'abs'
    assert_not @score_utbk.valid?
  end
  test "should reject for invalid nilai_pengetahuan_kuantitatif " do
    @score_utbk.nilai_pengetahuan_kuantitatif = -1
    assert_not @score_utbk.valid?
    @score_utbk.nilai_pengetahuan_kuantitatif = 2001
    assert_not @score_utbk.valid?
    @score_utbk.nilai_pengetahuan_kuantitatif = 'abs'
    assert_not @score_utbk.valid?
  end
  test "should reject for invalid nilai_kemampuan_memahami_bacaan_dan_menulis " do
    @score_utbk.nilai_kemampuan_memahami_bacaan_dan_menulis = -1
    assert_not @score_utbk.valid?
    @score_utbk.nilai_kemampuan_memahami_bacaan_dan_menulis = 2001
    assert_not @score_utbk.valid?
    @score_utbk.nilai_kemampuan_memahami_bacaan_dan_menulis = 'abs'
    assert_not @score_utbk.valid?
  end
  test "should reject for invalid nilai_pengetahuan_dan_pemahaman_umum " do
    @score_utbk.nilai_pengetahuan_dan_pemahaman_umum = -1
    assert_not @score_utbk.valid?
    @score_utbk.nilai_pengetahuan_dan_pemahaman_umum = 2001
    assert_not @score_utbk.valid?
    @score_utbk.nilai_pengetahuan_dan_pemahaman_umum = 'abs'
    assert_not @score_utbk.valid?
  end
  test "should accept decimal point to utbk score" do
    @score_utbk.nilai_penalaran_umum = 149.98
    assert @score_utbk.valid?
    assert_equal 149.98, @score_utbk.nilai_penalaran_umum
    assert_equal 189.5, utbk_scores(:utbk_score_two).reload.nilai_penalaran_umum
    assert_equal 179.5, utbk_scores(:utbk_score_one).reload.nilai_penalaran_umum
  end
  test "should reject jumlah matapelajaran un for non integer" do
    @score_utbk.jumlah_pelajaran_semester_6 =90.98
    assert_not @score_utbk.valid?
  end
end
