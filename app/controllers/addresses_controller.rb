# frozen_string_literal: true

# address controller : handle address
class AddressesController < ApplicationController
  before_action :set_address_dropdown_menu, only: %i[new create edit update]
  before_action :current_address, only: %i[edit show update]
  def new
    @address  = current_user.addresses.build
  end

  def update
    @address  = current_user.addresses.find(params[:id])
    if @address.update(address_params)
      flash[:success] = 'Address updated'
    else
      render 'edit'
    end
  end

  def create
    @address = current_user.addresses.build(address_params)
    if @address.save
      flash[:success] = 'Address saved'
    else
      render 'new'
    end
  end

  def edit
    @address = current_user.addresses.find(params[:id])
  end

  def show; end

  private

  def address_params
    params.require(:address).permit(:alamat, :kelurahan, :kecamatan, :kode_pos, :provinsi,
                                    :no_telepon, :kabupaten)
  end

  def set_address_dropdown_menu
    @province = AddressProvinceList.all # provinsi
    @kabupaten = AddressKabupatenList.all # kabupaten
    @kecamatan = AddressKecamatanList.all # kecamatan
  end

  def set_address
    @address = Address.find(params[:id])
  end

  def current_address
    @address = current_user.addresses.find_by(id: params[:id])
    redirect_to root_url if @address.nil?
  end
end
