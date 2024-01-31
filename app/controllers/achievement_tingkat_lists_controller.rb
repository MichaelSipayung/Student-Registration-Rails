# frozen_string_literal: true
# achievement tingkat list controller : handle achievement tingkat list
class AchievementTingkatListsController < ApplicationController
  before_action :set_achievement_tingkat_list, only: %i[show edit update destroy]
  before_action :admin_user, only: %i[create new edit update destroy]

  # GET /achievement_tingkat_lists or /achievement_tingkat_lists.json
  def index
    @achievement_tingkat_lists = AchievementTingkatList.all
  end

  # GET /achievement_tingkat_lists/1 or /achievement_tingkat_lists/1.json
  def show; end

  # GET /achievement_tingkat_lists/new
  def new
    @achievement_tingkat_list = AchievementTingkatList.new
  end

  # GET /achievement_tingkat_lists/1/edit
  def edit; end

  # POST /achievement_tingkat_lists or /achievement_tingkat_lists.json
  def create
    @achievement_tingkat_list = AchievementTingkatList.new(achievement_tingkat_list_params)

    respond_to do |format|
      if @achievement_tingkat_list.save
        format.html do
          redirect_to achievement_tingkat_list_url(@achievement_tingkat_list),
                      notice: 'Achievement tingkat list was successfully created.'
        end
        format.json { render :show, status: :created, location: @achievement_tingkat_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @achievement_tingkat_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /achievement_tingkat_lists/1 or /achievement_tingkat_lists/1.json
  def update
    respond_to do |format|
      if @achievement_tingkat_list.update(achievement_tingkat_list_params)
        format.html do
          redirect_to achievement_tingkat_list_url(@achievement_tingkat_list),
                      notice: 'Achievement tingkat list was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @achievement_tingkat_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @achievement_tingkat_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /achievement_tingkat_lists/1 or /achievement_tingkat_lists/1.json
  def destroy
    @achievement_tingkat_list.destroy!

    respond_to do |format|
      format.html do
        redirect_to achievement_tingkat_lists_url, notice: 'Achievement tingkat list was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_achievement_tingkat_list
    @achievement_tingkat_list = AchievementTingkatList.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def achievement_tingkat_list_params
    params.require(:achievement_tingkat_list).permit(:tingkat)
  end
end
