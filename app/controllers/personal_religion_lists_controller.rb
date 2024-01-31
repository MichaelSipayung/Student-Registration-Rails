# frozen_string_literal: true

# personal religion list controller : handle personal religion list
class PersonalReligionListsController < ApplicationController
  before_action :set_personal_religion_list, only: %i[show edit update destroy]
  before_action :admin_user, only: %i[create new edit update destroy]

  # GET /personal_religion_lists or /personal_religion_lists.json
  def index
    @personal_religion_lists = PersonalReligionList.all
  end

  # GET /personal_religion_lists/1 or /personal_religion_lists/1.json
  def show; end

  # GET /personal_religion_lists/new
  def new
    @personal_religion_list = PersonalReligionList.new
  end

  # GET /personal_religion_lists/1/edit
  def edit; end

  # POST /personal_religion_lists or /personal_religion_lists.json
  def create
    @personal_religion_list = PersonalReligionList.new(personal_religion_list_params)

    respond_to do |format|
      if @personal_religion_list.save
        format.html do
          redirect_to personal_religion_list_url(@personal_religion_list),
                      notice: 'Personal religion list was successfully created.'
        end
        format.json { render :show, status: :created, location: @personal_religion_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @personal_religion_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personal_religion_lists/1 or /personal_religion_lists/1.json
  def update
    respond_to do |format|
      if @personal_religion_list.update(personal_religion_list_params)
        format.html do
          redirect_to personal_religion_list_url(@personal_religion_list),
                      notice: 'Personal religion list was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @personal_religion_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @personal_religion_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_religion_lists/1 or /personal_religion_lists/1.json
  def destroy
    @personal_religion_list.destroy!

    respond_to do |format|
      format.html do
        redirect_to personal_religion_lists_url, notice: 'Personal religion list was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_personal_religion_list
    @personal_religion_list = PersonalReligionList.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def personal_religion_list_params
    params.require(:personal_religion_list).permit(:agama)
  end
end
