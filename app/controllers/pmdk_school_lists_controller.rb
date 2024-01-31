# frozen_string_literal: true
# pmdk school list controller : handle pmdk school list
class PmdkSchoolListsController < ApplicationController
  before_action :set_pmdk_school_list, only: %i[show edit update destroy]

  # GET /pmdk_school_lists or /pmdk_school_lists.json
  def index
    @pmdk_school_lists = PmdkSchoolList.all
  end

  # GET /pmdk_school_lists/1 or /pmdk_school_lists/1.json
  def show; end

  # GET /pmdk_school_lists/new
  def new
    @pmdk_school_list = PmdkSchoolList.new
  end

  # GET /pmdk_school_lists/1/edit
  def edit; end

  # POST /pmdk_school_lists or /pmdk_school_lists.json
  def create
    @pmdk_school_list = PmdkSchoolList.new(pmdk_school_list_params)

    respond_to do |format|
      if @pmdk_school_list.save
        format.html do
          redirect_to pmdk_school_list_url(@pmdk_school_list), notice: 'Pmdk school list was successfully created.'
        end
        format.json { render :show, status: :created, location: @pmdk_school_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pmdk_school_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pmdk_school_lists/1 or /pmdk_school_lists/1.json
  def update
    respond_to do |format|
      if @pmdk_school_list.update(pmdk_school_list_params)
        format.html do
          redirect_to pmdk_school_list_url(@pmdk_school_list), notice: 'Pmdk school list was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @pmdk_school_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pmdk_school_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pmdk_school_lists/1 or /pmdk_school_lists/1.json
  def destroy
    @pmdk_school_list.destroy!

    respond_to do |format|
      format.html { redirect_to pmdk_school_lists_url, notice: 'Pmdk school list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pmdk_school_list
    @pmdk_school_list = PmdkSchoolList.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def pmdk_school_list_params
    params.require(:pmdk_school_list).permit(:sekolah)
  end
end
