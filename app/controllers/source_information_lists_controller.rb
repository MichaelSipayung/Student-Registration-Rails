# frozen_string_literal: true

# source information list controller : handle source information list
class SourceInformationListsController < ApplicationController
  before_action :set_source_information_list, only: %i[show edit update destroy]
  before_action :admin_user, only: %i[create new edit update destroy]
  # GET /source_information_lists or /source_information_lists.json
  def index
    @source_information_lists = SourceInformationList.all
  end

  # GET /source_information_lists/1 or /source_information_lists/1.json
  def show; end

  # GET /source_information_lists/new
  def new
    @source_information_list = SourceInformationList.new
  end

  # GET /source_information_lists/1/edit
  def edit; end

  # POST /source_information_lists or /source_information_lists.json
  def create
    @source_information_list = SourceInformationList.new(source_information_list_params)

    respond_to do |format|
      if @source_information_list.save
        format.html do
          redirect_to source_information_list_url(@source_information_list),
                      notice: 'Source information list was successfully created.'
        end
        format.json { render :show, status: :created, location: @source_information_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @source_information_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /source_information_lists/1 or /source_information_lists/1.json
  def update
    respond_to do |format|
      if @source_information_list.update(source_information_list_params)
        format.html do
          redirect_to source_information_list_url(@source_information_list),
                      notice: 'Source information list was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @source_information_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @source_information_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /source_information_lists/1 or /source_information_lists/1.json
  def destroy
    @source_information_list.destroy!

    respond_to do |format|
      format.html do
        redirect_to source_information_lists_url, notice: 'Source information list was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_source_information_list
    @source_information_list = SourceInformationList.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def source_information_list_params
    params.require(:source_information_list).permit(:informasi)
  end
end
