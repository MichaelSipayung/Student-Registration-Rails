# frozen_string_literal: true
# major list controller : handle major list
class MajorListsController < ApplicationController
  before_action :set_major_list, only: %i[show edit update destroy]

  # GET /major_lists or /major_lists.json
  def index
    @major_lists = MajorList.all
  end

  # GET /major_lists/1 or /major_lists/1.json
  def show; end

  # GET /major_lists/new
  def new
    @major_list = MajorList.new
  end

  # GET /major_lists/1/edit
  def edit; end

  # POST /major_lists or /major_lists.json
  def create
    @major_list = MajorList.new(major_list_params)

    respond_to do |format|
      if @major_list.save
        format.html { redirect_to major_list_url(@major_list), notice: 'Major list was successfully created.' }
        format.json { render :show, status: :created, location: @major_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @major_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /major_lists/1 or /major_lists/1.json
  def update
    respond_to do |format|
      if @major_list.update(major_list_params)
        format.html { redirect_to major_list_url(@major_list), notice: 'Major list was successfully updated.' }
        format.json { render :show, status: :ok, location: @major_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @major_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /major_lists/1 or /major_lists/1.json
  def destroy
    @major_list.destroy!

    respond_to do |format|
      format.html { redirect_to major_lists_url, notice: 'Major list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_major_list
    @major_list = MajorList.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def major_list_params
    params.require(:major_list).permit(:jurusan)
  end
end
