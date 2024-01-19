class OrganizationsController < ApplicationController
  def new
    @organization = current_user.organizations.build
  end

  def update
    @organization = current_user.organizations.find(params[:id])
    if @organization.update(organization_params)
      flash[:success] = "Organization is updated"
    else
      render 'edit'
    end
  end

  def create
    @organization = current_user.organizations.build(organization_params)
    if @organization.save
      flash[:success] = "Organization is created"
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
end
