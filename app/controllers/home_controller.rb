class HomeController < ApplicationController
  def index
    redirect_to discussions_path unless !current_user
  end
end