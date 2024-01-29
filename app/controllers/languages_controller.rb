class LanguagesController < ApplicationController
  before_action :set_language_dropdown_menu, only: [:new, :create, :edit, :update]
  def new
    @language = current_user.languages.build
  end

  def update
    @language = current_user.languages.find(params[:id])
    if @language.update(language_params)
      flash[:success] = "language is updated"
    else
      render 'edit'
    end
  end

  def create
    @language  = current_user.languages.build(language_params)
    if @language.save
      flash[:success] =  "Language is created"
    else
      render 'new'
    end
  end

  def edit
    @language = current_user.languages.find(params[:id])
  end

  def show
  end
  private
    def language_params
      params.require(:language).permit(:nama_bahasa, :tingkat)
    end
  def set_language_dropdown_menu
    @language_name_list = LanguageNameList.all
    @language_degree_list  = LanguageDegreeList.all
  end
end
