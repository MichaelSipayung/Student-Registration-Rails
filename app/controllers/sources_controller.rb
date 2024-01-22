class SourcesController < ApplicationController
  def new
    @source = current_user.build_source
  end

  def update
    @source  = current_user.source
    if @source.update(source_params)
      flash[:success] = "source of information is updated"
    else
      render 'edit'
    end
  end

  def create
    @source = current_user.build_source(source_params)
    if @source.save
      flash[:success] = "source of information created"
    else
      render 'new'
    end
  end

  def edit
    @source = current_user.source
  end

  def show
  end
  private
  def source_params
    params.require(:source).permit(:jumlah_n, :sumber_informasi, :motivasi)
  end
end
