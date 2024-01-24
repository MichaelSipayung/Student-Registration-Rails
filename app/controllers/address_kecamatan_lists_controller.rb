class AddressKecamatanListsController < ApplicationController
  before_action :set_address_kecamatan_list, only: %i[ show edit update destroy ]

  # GET /address_kecamatan_lists or /address_kecamatan_lists.json
  def index
    @address_kecamatan_lists = AddressKecamatanList.all
  end

  # GET /address_kecamatan_lists/1 or /address_kecamatan_lists/1.json
  def show
  end

  # GET /address_kecamatan_lists/new
  def new
    @address_kecamatan_list = AddressKecamatanList.new
  end

  # GET /address_kecamatan_lists/1/edit
  def edit
  end

  # POST /address_kecamatan_lists or /address_kecamatan_lists.json
  def create
    @address_kecamatan_list = AddressKecamatanList.new(address_kecamatan_list_params)

    respond_to do |format|
      if @address_kecamatan_list.save
        format.html { redirect_to address_kecamatan_list_url(@address_kecamatan_list), notice: "Address kecamatan list was successfully created." }
        format.json { render :show, status: :created, location: @address_kecamatan_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @address_kecamatan_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /address_kecamatan_lists/1 or /address_kecamatan_lists/1.json
  def update
    respond_to do |format|
      if @address_kecamatan_list.update(address_kecamatan_list_params)
        format.html { redirect_to address_kecamatan_list_url(@address_kecamatan_list), notice: "Address kecamatan list was successfully updated." }
        format.json { render :show, status: :ok, location: @address_kecamatan_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @address_kecamatan_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /address_kecamatan_lists/1 or /address_kecamatan_lists/1.json
  def destroy
    @address_kecamatan_list.destroy!

    respond_to do |format|
      format.html { redirect_to address_kecamatan_lists_url,
                                notice: "Address kecamatan list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address_kecamatan_list
      @address_kecamatan_list = AddressKecamatanList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def address_kecamatan_list_params
      params.require(:address_kecamatan_list).permit(:kecamatan, :address_kabupaten_list_id)
    end
end
