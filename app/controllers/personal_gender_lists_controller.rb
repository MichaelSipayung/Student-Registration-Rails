# frozen_string_literal: true
# personal religion list controller : handle personal religion list
class PersonalGenderListsController < ApplicationController
  before_action :set_personal_gender_list, only: %i[show edit update destroy]

  # GET /personal_gender_lists or /personal_gender_lists.json
  def index
    @personal_gender_lists = PersonalGenderList.all
  end

  # GET /personal_gender_lists/1 or /personal_gender_lists/1.json
  def show; end

  # GET /personal_gender_lists/new
  def new
    @personal_gender_list = PersonalGenderList.new
  end

  # GET /personal_gender_lists/1/edit
  def edit; end

  # POST /personal_gender_lists or /personal_gender_lists.json
  def create
    @personal_gender_list = PersonalGenderList.new(personal_gender_list_params)

    respond_to do |format|
      if @personal_gender_list.save
        format.html do
          redirect_to personal_gender_list_url(@personal_gender_list),
                      notice: 'Personal gender list was successfully created.'
        end
        format.json { render :show, status: :created, location: @personal_gender_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @personal_gender_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personal_gender_lists/1 or /personal_gender_lists/1.json
  def update
    respond_to do |format|
      if @personal_gender_list.update(personal_gender_list_params)
        format.html do
          redirect_to personal_gender_list_url(@personal_gender_list),
                      notice: 'Personal gender list was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @personal_gender_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @personal_gender_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personal_gender_lists/1 or /personal_gender_lists/1.json
  def destroy
    @personal_gender_list.destroy!

    respond_to do |format|
      format.html { redirect_to personal_gender_lists_url, notice: 'Personal gender list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_personal_gender_list
    @personal_gender_list = PersonalGenderList.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def personal_gender_list_params
    params.require(:personal_gender_list).permit(:jenis_kelamin)
  end
end
