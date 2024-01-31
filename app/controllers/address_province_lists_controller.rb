# frozen_string_literal: true

class AddressProvinceListsController < ApplicationController
  before_action :set_address_province_list, only: %i[show edit update destroy]

  # GET /address_province_lists or /address_province_lists.json
  def index
    @address_province_lists = AddressProvinceList.all
  end

  # GET /address_province_lists/1 or /address_province_lists/1.json
  def show; end

  # GET /address_province_lists/new
  def new
    @address_province_list = AddressProvinceList.new
  end

  # GET /address_province_lists/1/edit
  def edit; end

  # POST /address_province_lists or /address_province_lists.json
  def create
    @address_province_list = AddressProvinceList.new(address_province_list_params)

    respond_to do |format|
      if @address_province_list.save
        format.html do
          redirect_to address_province_list_url(@address_province_list),
                      notice: 'Address province list was successfully created.'
        end
        format.json { render :show, status: :created, location: @address_province_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @address_province_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /address_province_lists/1 or /address_province_lists/1.json
  def update
    respond_to do |format|
      if @address_province_list.update(address_province_list_params)
        format.html do
          redirect_to address_province_list_url(@address_province_list),
                      notice: 'Address province list was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @address_province_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @address_province_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /address_province_lists/1 or /address_province_lists/1.json
  def destroy
    @address_province_list.destroy!

    respond_to do |format|
      format.html do
        redirect_to address_province_lists_url, notice: 'Address province list was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_address_province_list
    @address_province_list = AddressProvinceList.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def address_province_list_params
    params.require(:address_province_list).permit(:provinsi)
  end
end
