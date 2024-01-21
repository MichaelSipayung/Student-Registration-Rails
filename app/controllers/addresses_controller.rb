class AddressesController < ApplicationController
  def new
    @address  = current_user.addresses.build
  end

  def update
    @address  = current_user.addresses.find(params[:id])
    if @address.update(address_params)
      flash[:success] = "Address updated"
    else
      render 'edit'
    end
  end

  def create
    @address  = current_user.addresses.build(address_params)
    if @address.save
      flash[:success] = "Address saved"
    else
      render 'new'
    end
  end

  def edit
    @address  = current_user.addresses.find(params[:id])
  end

  def show
  end
  private
  def address_params
    params.require(:address).permit(:alamat, :kelurahan, :kecamatan, :kode_pos, :provinsi,
                                    :no_telepon, :kabupaten)
  end
end