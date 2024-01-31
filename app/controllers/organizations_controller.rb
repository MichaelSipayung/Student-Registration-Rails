class OrganizationsController < ApplicationController
  before_action :set_organization_dropdown_menu, only: [:new, :create, :edit, :update]
  before_action :set_organization, only: %i[edit show update]
  def new
    @organization = current_user.organizations.build
  end

  def update
    @organization = current_user.organizations.find(params[:id])
    if @organization.update(organization_params)
      flash[:success] = 'Organization is updated'
    else
      render 'edit'
    end
  end

  def create
    @organization = current_user.organizations.build(organization_params)
    if @organization.save
      flash[:success] = 'Organization is created'
    else
      render 'new'
    end
  end

  def edit
    @organization = current_user.organizations.find(params[:id])
  end

  def show
  end
  private
  def organization_params
    params.require(:organization).permit(:nama_organisasi, :mulai, :berakhir, :jabatan)
  end
  def set_organization_dropdown_menu
    @organization_degree_list = OrganizationDegreeList.all
  end
  def set_organization
    @organization = Organization.find(params[:id])
  end
end
