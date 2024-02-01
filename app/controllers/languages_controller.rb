# frozen_string_literal: true

# language controller : handle language
class LanguagesController < ApplicationController
  before_action :set_language_dropdown_menu, only: %i[new create edit update]
  before_action :current_language, only: %i[edit update show]
  def new
    @language = current_user.languages.build
  end

  def update
    @language = current_user.languages.find(params[:id])
    if @language.update(language_params)
      flash[:success] = 'language is updated'
    else
      render 'edit'
    end
  end

  def create
    @language = current_user.languages.build(language_params)
    if @language.save
      flash[:success] = 'Language is created'
    else
      render 'new'
    end
  end

  def edit
    @language = current_user.languages.find(params[:id])
  end

  def show; end

  private

  def language_params
    params.require(:language).permit(:nama_bahasa, :tingkat)
  end

  def set_language_dropdown_menu
    @language_name_list = LanguageNameList.all
    @language_degree_list = LanguageDegreeList.all
  end

  def set_language
    @language = Language.find(params[:id])
  end

  def current_language
    @language = current_user.languages.find_by(id: params[:id])
    redirect_to root_url if @language.nil?
  end
end
