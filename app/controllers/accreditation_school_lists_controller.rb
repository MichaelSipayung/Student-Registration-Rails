# frozen_string_literal: true

# accreditation controller : handle accreditation
class AccreditationSchoolListsController < ApplicationController
  before_action :set_accreditation_school_list, only: %i[show edit update destroy]
  before_action :admin_user, only: %i[create new edit update destroy]

  # GET /accreditation_school_lists or /accreditation_school_lists.json
  def index
    @accreditation_school_lists = AccreditationSchoolList.all
  end

  # GET /accreditation_school_lists/1 or /accreditation_school_lists/1.json
  def show; end

  # GET /accreditation_school_lists/new
  def new
    @accreditation_school_list = AccreditationSchoolList.new
  end

  # GET /accreditation_school_lists/1/edit
  def edit; end

  # POST /accreditation_school_lists or /accreditation_school_lists.json
  def create
    @accreditation_school_list = AccreditationSchoolList.new(accreditation_school_list_params)

    respond_to do |format|
      if @accreditation_school_list.save
        format.html do
          redirect_to accreditation_school_list_url(@accreditation_school_list),
                      notice: 'Accreditation school list was successfully created.'
        end
        format.json { render :show, status: :created, location: @accreditation_school_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @accreditation_school_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accreditation_school_lists/1 or /accreditation_school_lists/1.json
  def update
    respond_to do |format|
      if @accreditation_school_list.update(accreditation_school_list_params)
        format.html do
          redirect_to accreditation_school_list_url(@accreditation_school_list),
                      notice: 'Accreditation school list was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @accreditation_school_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @accreditation_school_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accreditation_school_lists/1 or /accreditation_school_lists/1.json
  def destroy
    @accreditation_school_list.destroy!

    respond_to do |format|
      format.html do
        redirect_to accreditation_school_lists_url, notice: 'Accreditation school list was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_accreditation_school_list
    @accreditation_school_list = AccreditationSchoolList.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def accreditation_school_list_params
    params.require(:accreditation_school_list).permit(:akreditasi)
  end
end
