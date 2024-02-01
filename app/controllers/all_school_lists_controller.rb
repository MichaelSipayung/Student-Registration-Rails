# frozen_string_literal: true

# all school list controller : handle all school list
class AllSchoolListsController < ApplicationController
  before_action :set_all_school_list, only: %i[show edit update destroy]
  before_action :admin_user, only: %i[create new edit update destroy]

  # GET /all_school_lists or /all_school_lists.json
  def index
    @all_school_lists = AllSchoolList.all
  end

  # GET /all_school_lists/1 or /all_school_lists/1.json
  def show; end

  # GET /all_school_lists/new
  def new
    @all_school_list = AllSchoolList.new
  end

  # GET /all_school_lists/1/edit
  def edit; end

  # POST /all_school_lists or /all_school_lists.json
  def create
    @all_school_list = AllSchoolList.new(all_school_list_params)

    respond_to do |format|
      if @all_school_list.save
        format.html do
          redirect_to all_school_list_url(@all_school_list), notice: 'All school list was successfully created.'
        end
        format.json { render :show, status: :created, location: @all_school_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @all_school_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /all_school_lists/1 or /all_school_lists/1.json
  def update
    respond_to do |format|
      if @all_school_list.update(all_school_list_params)
        format.html do
          redirect_to all_school_list_url(@all_school_list), notice: 'All school list was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @all_school_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @all_school_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /all_school_lists/1 or /all_school_lists/1.json
  def destroy
    @all_school_list.destroy!

    respond_to do |format|
      format.html { redirect_to all_school_lists_url, notice: 'All school list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_all_school_list
    @all_school_list = AllSchoolList.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def all_school_list_params
    params.require(:all_school_list).permit(:sekolah)
  end
end
