# frozen_string_literal: true

class HighSchoolMajorsController < ApplicationController
  before_action :set_high_school_major, only: %i[show edit update destroy]

  # GET /high_school_majors or /high_school_majors.json
  def index
    @high_school_majors = HighSchoolMajor.all
  end

  # GET /high_school_majors/1 or /high_school_majors/1.json
  def show; end

  # GET /high_school_majors/new
  def new
    @high_school_major = HighSchoolMajor.new
  end

  # GET /high_school_majors/1/edit
  def edit; end

  # POST /high_school_majors or /high_school_majors.json
  def create
    @high_school_major = HighSchoolMajor.new(high_school_major_params)

    respond_to do |format|
      if @high_school_major.save
        format.html do
          redirect_to high_school_major_url(@high_school_major), notice: 'High school major was successfully created.'
        end
        format.json { render :show, status: :created, location: @high_school_major }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @high_school_major.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /high_school_majors/1 or /high_school_majors/1.json
  def update
    respond_to do |format|
      if @high_school_major.update(high_school_major_params)
        format.html do
          redirect_to high_school_major_url(@high_school_major), notice: 'High school major was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @high_school_major }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @high_school_major.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /high_school_majors/1 or /high_school_majors/1.json
  def destroy
    @high_school_major.destroy!

    respond_to do |format|
      format.html { redirect_to high_school_majors_url, notice: 'High school major was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_high_school_major
    @high_school_major = HighSchoolMajor.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def high_school_major_params
    params.require(:high_school_major).permit(:jurusan)
  end
end
