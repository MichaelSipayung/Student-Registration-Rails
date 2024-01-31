class AchievementKategoriListsController < ApplicationController
  before_action :set_achievement_kategori_list, only: %i[show edit update destroy]

  # GET /achievement_kategori_lists or /achievement_kategori_lists.json
  def index
    @achievement_kategori_lists = AchievementKategoriList.all
  end

  # GET /achievement_kategori_lists/1 or /achievement_kategori_lists/1.json
  def show
  end

  # GET /achievement_kategori_lists/new
  def new
    @achievement_kategori_list = AchievementKategoriList.new
  end

  # GET /achievement_kategori_lists/1/edit
  def edit
  end

  # POST /achievement_kategori_lists or /achievement_kategori_lists.json
  def create
    @achievement_kategori_list = AchievementKategoriList.new(achievement_kategori_list_params)

    respond_to do |format|
      if @achievement_kategori_list.save
        format.html { redirect_to achievement_kategori_list_url(@achievement_kategori_list), notice: "Achievement kategori list was successfully created." }
        format.json { render :show, status: :created, location: @achievement_kategori_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @achievement_kategori_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /achievement_kategori_lists/1 or /achievement_kategori_lists/1.json
  def update
    respond_to do |format|
      if @achievement_kategori_list.update(achievement_kategori_list_params)
        format.html { redirect_to achievement_kategori_list_url(@achievement_kategori_list), notice: "Achievement kategori list was successfully updated." }
        format.json { render :show, status: :ok, location: @achievement_kategori_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @achievement_kategori_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /achievement_kategori_lists/1 or /achievement_kategori_lists/1.json
  def destroy
    @achievement_kategori_list.destroy!

    respond_to do |format|
      format.html { redirect_to achievement_kategori_lists_url, notice: "Achievement kategori list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_achievement_kategori_list
      @achievement_kategori_list = AchievementKategoriList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def achievement_kategori_list_params
      params.require(:achievement_kategori_list).permit(:kategori)
    end
end
