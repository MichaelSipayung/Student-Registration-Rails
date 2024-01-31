# frozen_string_literal: true
# organization degree list controller : handle organization degree list
class OrganizationDegreeListsController < ApplicationController
  before_action :set_organization_degree_list, only: %i[show edit update destroy]

  # GET /organization_degree_lists or /organization_degree_lists.json
  def index
    @organization_degree_lists = OrganizationDegreeList.all
  end

  # GET /organization_degree_lists/1 or /organization_degree_lists/1.json
  def show; end

  # GET /organization_degree_lists/new
  def new
    @organization_degree_list = OrganizationDegreeList.new
  end

  # GET /organization_degree_lists/1/edit
  def edit; end

  # POST /organization_degree_lists or /organization_degree_lists.json
  def create
    @organization_degree_list = OrganizationDegreeList.new(organization_degree_list_params)

    respond_to do |format|
      if @organization_degree_list.save
        format.html do
          redirect_to organization_degree_list_url(@organization_degree_list),
                      notice: 'Organization degree list was successfully created.'
        end
        format.json { render :show, status: :created, location: @organization_degree_list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @organization_degree_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organization_degree_lists/1 or /organization_degree_lists/1.json
  def update
    respond_to do |format|
      if @organization_degree_list.update(organization_degree_list_params)
        format.html do
          redirect_to organization_degree_list_url(@organization_degree_list),
                      notice: 'Organization degree list was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @organization_degree_list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @organization_degree_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organization_degree_lists/1 or /organization_degree_lists/1.json
  def destroy
    @organization_degree_list.destroy!

    respond_to do |format|
      format.html do
        redirect_to organization_degree_lists_url, notice: 'Organization degree list was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_organization_degree_list
    @organization_degree_list = OrganizationDegreeList.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def organization_degree_list_params
    params.require(:organization_degree_list).permit(:jabatan)
  end
end
