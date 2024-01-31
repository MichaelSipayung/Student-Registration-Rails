# frozen_string_literal: true
# parent education list controller : handle parent education list
class ParentEducationListsController < ApplicationController
  before_action :set_parent_education_list, only: %i[show edit update destroy]
  before_action :admin_user, only: %i[create new edit update destroy]

  # GET /parent_education_lists or /parent_education_lists.json
  def index
    @parent_education_lists = ParentEducationList.all
  end

  # GET /parent_education_lists/1 or /parent_education_lists/1.json
  def show; end

  # GET /parent_education_lists/new
  def new
    @parent_education_list = ParentEducationList.new
  end

  # GET /parent_education_lists/1/edit
  def edit; end

  # POST /parent_education_lists or /parent_education_lists.json
  def create
    @parent_education_list = ParentEducationList.new(parent_education_list_params)

    respond_to do |format|
      if @parent_education_list.save
        format.html do
          redirect_to parent_education_list_url(@parent_education_list),
                      notice: 'Parent education list was successfully created.'
        end
        format.json { render :show, status: :created, location: @parent_education_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @parent_education_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parent_education_lists/1 or /parent_education_lists/1.json
  def update
    respond_to do |format|
      if @parent_education_list.update(parent_education_list_params)
        format.html do
          redirect_to parent_education_list_url(@parent_education_list),
                      notice: 'Parent education list was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @parent_education_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @parent_education_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parent_education_lists/1 or /parent_education_lists/1.json
  def destroy
    @parent_education_list.destroy!

    respond_to do |format|
      format.html do
        redirect_to parent_education_lists_url, notice: 'Parent education list was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_parent_education_list
    @parent_education_list = ParentEducationList.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def parent_education_list_params
    params.require(:parent_education_list).permit(:pendidikan)
  end
end
