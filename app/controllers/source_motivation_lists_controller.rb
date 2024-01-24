class SourceMotivationListsController < ApplicationController
  before_action :set_source_motivation_list, only: %i[ show edit update destroy ]

  # GET /source_motivation_lists or /source_motivation_lists.json
  def index
    @source_motivation_lists = SourceMotivationList.all
  end

  # GET /source_motivation_lists/1 or /source_motivation_lists/1.json
  def show
  end

  # GET /source_motivation_lists/new
  def new
    @source_motivation_list = SourceMotivationList.new
  end

  # GET /source_motivation_lists/1/edit
  def edit
  end

  # POST /source_motivation_lists or /source_motivation_lists.json
  def create
    @source_motivation_list = SourceMotivationList.new(source_motivation_list_params)

    respond_to do |format|
      if @source_motivation_list.save
        format.html { redirect_to source_motivation_list_url(@source_motivation_list), notice: "Source motivation list was successfully created." }
        format.json { render :show, status: :created, location: @source_motivation_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @source_motivation_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /source_motivation_lists/1 or /source_motivation_lists/1.json
  def update
    respond_to do |format|
      if @source_motivation_list.update(source_motivation_list_params)
        format.html { redirect_to source_motivation_list_url(@source_motivation_list), notice: "Source motivation list was successfully updated." }
        format.json { render :show, status: :ok, location: @source_motivation_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @source_motivation_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /source_motivation_lists/1 or /source_motivation_lists/1.json
  def destroy
    @source_motivation_list.destroy!

    respond_to do |format|
      format.html { redirect_to source_motivation_lists_url, notice: "Source motivation list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_source_motivation_list
      @source_motivation_list = SourceMotivationList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def source_motivation_list_params
      params.require(:source_motivation_list).permit(:motivasi)
    end
end
