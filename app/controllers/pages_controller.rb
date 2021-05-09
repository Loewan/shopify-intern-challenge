class PagesController < ApplicationController
  def index
    redirect_to images_path if logged_in?
  end


end
