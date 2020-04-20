class LanguagesController < ApplicationController
  def show
    language = Language.find(params[:id])
    @posts = language.posts.order("created_at DESC")
    @name = language.name
  end
end
