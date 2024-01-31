# frozen_string_literal: true

class BatchListsController < ApplicationController
  before_action :set_batch_list, only: %i[show edit update destroy]

  # GET /batch_lists or /batch_lists.json
  def index
    @batch_lists = BatchList.all
  end

  # GET /batch_lists/1 or /batch_lists/1.json
  def show; end

  # GET /batch_lists/new
  def new
    @batch_list = BatchList.new
  end

  # GET /batch_lists/1/edit
  def edit; end

  # POST /batch_lists or /batch_lists.json
  def create
    @batch_list = BatchList.new(batch_list_params)

    respond_to do |format|
      if @batch_list.save
        format.html { redirect_to batch_list_url(@batch_list), notice: 'Batch list was successfully created.' }
        format.json { render :show, status: :created, location: @batch_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @batch_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batch_lists/1 or /batch_lists/1.json
  def update
    respond_to do |format|
      if @batch_list.update(batch_list_params)
        format.html { redirect_to batch_list_url(@batch_list), notice: 'Batch list was successfully updated.' }
        format.json { render :show, status: :ok, location: @batch_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @batch_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batch_lists/1 or /batch_lists/1.json
  def destroy
    @batch_list.destroy!

    respond_to do |format|
      format.html { redirect_to batch_lists_url, notice: 'Batch list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_batch_list
    @batch_list = BatchList.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def batch_list_params
    params.require(:batch_list).permit(:gelombang, :aktif)
  end
end
