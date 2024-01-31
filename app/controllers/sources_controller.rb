# frozen_string_literal: true

class SourcesController < ApplicationController
  before_action :set_source_dropdown_menu, only: %i[new create edit update]
  before_action :set_source_information, only: %i[edit update show]

  def new
    @source = current_user.build_source
  end

  def update
    @source = current_user.source
    if @source.update(source_params)
      flash[:success] = 'source of information is updated'
    else
      render 'edit'
    end
  end

  def create
    @source = current_user.build_source(source_params)
    if @source.save
      flash[:success] = 'source of information created'
    else
      render 'new'
    end
  end

  def edit
    @source = current_user.source
  end

  def show; end

  private

  def source_params
    params.require(:source).permit(:jumlah_n, :sumber_informasi, :motivasi)
  end

  def set_source_dropdown_menu
    @source_motivation_list = SourceMotivationList.all
    @source_information_list = SourceInformationList.all
  end

  def set_source_information
    @source = Source.find(params[:id])
  end
end
