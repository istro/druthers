class HomeController < ApplicationController
  def index
    redirect_to discussions_path if signed_in?
  end
end