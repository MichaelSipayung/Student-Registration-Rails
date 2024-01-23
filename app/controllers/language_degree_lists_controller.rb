class LanguageDegreeListsController < ApplicationController
  before_action :set_language_degree_list, only: %i[ show edit update destroy ]

  # GET /language_degree_lists or /language_degree_lists.json
  def index
    @language_degree_lists = LanguageDegreeList.all
  end

  # GET /language_degree_lists/1 or /language_degree_lists/1.json
  def show
  end

  # GET /language_degree_lists/new
  def new
    @language_degree_list = LanguageDegreeList.new
  end

  # GET /language_degree_lists/1/edit
  def edit
  end

  # POST /language_degree_lists or /language_degree_lists.json
  def create
    @language_degree_list = LanguageDegreeList.new(language_degree_list_params)

    respond_to do |format|
      if @language_degree_list.save
        format.html { redirect_to language_degree_list_url(@language_degree_list), notice: "Language degree list was successfully created." }
        format.json { render :show, status: :created, location: @language_degree_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @language_degree_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /language_degree_lists/1 or /language_degree_lists/1.json
  def update
    respond_to do |format|
      if @language_degree_list.update(language_degree_list_params)
        format.html { redirect_to language_degree_list_url(@language_degree_list), notice: "Language degree list was successfully updated." }
        format.json { render :show, status: :ok, location: @language_degree_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @language_degree_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /language_degree_lists/1 or /language_degree_lists/1.json
  def destroy
    @language_degree_list.destroy!

    respond_to do |format|
      format.html { redirect_to language_degree_lists_url, notice: "Language degree list was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_language_degree_list
      @language_degree_list = LanguageDegreeList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def language_degree_list_params
      params.require(:language_degree_list).permit(:tingkat)
    end
end
