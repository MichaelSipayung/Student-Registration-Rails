# frozen_string_literal: true

class AddressKabupatenListsController < ApplicationController
  before_action :set_address_kabupaten_list, only: %i[show edit update destroy]

  # GET /address_kabupaten_lists or /address_kabupaten_lists.json
  def index
    @address_kabupaten_lists = AddressKabupatenList.all
  end

  # GET /address_kabupaten_lists/1 or /address_kabupaten_lists/1.json
  def show; end

  # GET /address_kabupaten_lists/new
  def new
    @address_kabupaten_list = AddressKabupatenList.new
  end

  # GET /address_kabupaten_lists/1/edit
  def edit; end

  # POST /address_kabupaten_lists or /address_kabupaten_lists.json
  def create
    @address_kabupaten_list = AddressKabupatenList.new(address_kabupaten_list_params)

    respond_to do |format|
      if @address_kabupaten_list.save
        format.html do
          redirect_to address_kabupaten_list_url(@address_kabupaten_list),
                      notice: 'Address kabupaten list was successfully created.'
        end
        format.json { render :show, status: :created, location: @address_kabupaten_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @address_kabupaten_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /address_kabupaten_lists/1 or /address_kabupaten_lists/1.json
  def update
    respond_to do |format|
      if @address_kabupaten_list.update(address_kabupaten_list_params)
        format.html do
          redirect_to address_kabupaten_list_url(@address_kabupaten_list),
                      notice: 'Address kabupaten list was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @address_kabupaten_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @address_kabupaten_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /address_kabupaten_lists/1 or /address_kabupaten_lists/1.json
  def destroy
    @address_kabupaten_list.destroy!

    respond_to do |format|
      format.html do
        redirect_to address_kabupaten_lists_url, notice: 'Address kabupaten list was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_address_kabupaten_list
    @address_kabupaten_list = AddressKabupatenList.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def address_kabupaten_list_params
    params.require(:address_kabupaten_list).permit(:kabupaten, :address_province_list_id)
  end
end
