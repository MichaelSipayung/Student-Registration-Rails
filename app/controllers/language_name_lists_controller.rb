# frozen_string_literal: true
# language name list controller : handle language name list
class LanguageNameListsController < ApplicationController
  before_action :set_language_name_list, only: %i[show edit update destroy]

  # GET /language_name_lists or /language_name_lists.json
  def index
    @language_name_lists = LanguageNameList.all
  end

  # GET /language_name_lists/1 or /language_name_lists/1.json
  def show; end

  # GET /language_name_lists/new
  def new
    @language_name_list = LanguageNameList.new
  end

  # GET /language_name_lists/1/edit
  def edit; end

  # POST /language_name_lists or /language_name_lists.json
  def create
    @language_name_list = LanguageNameList.new(language_name_list_params)

    respond_to do |format|
      if @language_name_list.save
        format.html do
          redirect_to language_name_list_url(@language_name_list),
                      notice: 'Language name list was successfully created.'
        end
        format.json { render :show, status: :created, location: @language_name_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @language_name_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /language_name_lists/1 or /language_name_lists/1.json
  def update
    respond_to do |format|
      if @language_name_list.update(language_name_list_params)
        format.html do
          redirect_to language_name_list_url(@language_name_list),
                      notice: 'Language name list was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @language_name_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @language_name_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /language_name_lists/1 or /language_name_lists/1.json
  def destroy
    @language_name_list.destroy!

    respond_to do |format|
      format.html { redirect_to language_name_lists_url, notice: 'Language name list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_language_name_list
    @language_name_list = LanguageNameList.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def language_name_list_params
    params.require(:language_name_list).permit(:bahasa)
  end
end
