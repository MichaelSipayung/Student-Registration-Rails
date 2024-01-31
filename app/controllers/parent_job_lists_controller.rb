# frozen_string_literal: true

# parent job list controller : handle parent job list
class ParentJobListsController < ApplicationController
  before_action :set_parent_job_list, only: %i[show edit update destroy]
  before_action :admin_user, only: %i[create new edit update destroy]

  # GET /parent_job_lists or /parent_job_lists.json
  def index
    @parent_job_lists = ParentJobList.all
  end

  # GET /parent_job_lists/1 or /parent_job_lists/1.json
  def show; end

  # GET /parent_job_lists/new
  def new
    @parent_job_list = ParentJobList.new
  end

  # GET /parent_job_lists/1/edit
  def edit; end

  # POST /parent_job_lists or /parent_job_lists.json
  def create
    @parent_job_list = ParentJobList.new(parent_job_list_params)

    respond_to do |format|
      if @parent_job_list.save
        format.html do
          redirect_to parent_job_list_url(@parent_job_list), notice: 'Parent job list was successfully created.'
        end
        format.json { render :show, status: :created, location: @parent_job_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @parent_job_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parent_job_lists/1 or /parent_job_lists/1.json
  def update
    respond_to do |format|
      if @parent_job_list.update(parent_job_list_params)
        format.html do
          redirect_to parent_job_list_url(@parent_job_list), notice: 'Parent job list was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @parent_job_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parent_job_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parent_job_lists/1 or /parent_job_lists/1.json
  def destroy
    @parent_job_list.destroy!

    respond_to do |format|
      format.html { redirect_to parent_job_lists_url, notice: 'Parent job list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_parent_job_list
    @parent_job_list = ParentJobList.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def parent_job_list_params
    params.require(:parent_job_list).permit(:pekerjaan)
  end
end
