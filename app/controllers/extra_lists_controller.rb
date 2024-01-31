# frozen_string_literal: true
# extra list controller : handle extra list
class ExtraListsController < ApplicationController
  before_action :set_extra_list, only: %i[show edit update destroy]

  # GET /extra_lists or /extra_lists.json
  def index
    @extra_lists = ExtraList.all
  end

  # GET /extra_lists/1 or /extra_lists/1.json
  def show; end

  # GET /extra_lists/new
  def new
    @extra_list = ExtraList.new
  end

  # GET /extra_lists/1/edit
  def edit; end

  # POST /extra_lists or /extra_lists.json
  def create
    @extra_list = ExtraList.new(extra_list_params)

    respond_to do |format|
      if @extra_list.save
        format.html { redirect_to extra_list_url(@extra_list), notice: 'Extra list was successfully created.' }
        format.json { render :show, status: :created, location: @extra_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @extra_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /extra_lists/1 or /extra_lists/1.json
  def update
    respond_to do |format|
      if @extra_list.update(extra_list_params)
        format.html { redirect_to extra_list_url(@extra_list), notice: 'Extra list was successfully updated.' }
        format.json { render :show, status: :ok, location: @extra_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @extra_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /extra_lists/1 or /extra_lists/1.json
  def destroy
    @extra_list.destroy!

    respond_to do |format|
      format.html { redirect_to extra_lists_url, notice: 'Extra list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_extra_list
    @extra_list = ExtraList.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def extra_list_params
    params.require(:extra_list).permit(:predikat)
  end
end
