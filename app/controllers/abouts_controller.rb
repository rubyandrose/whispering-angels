class AboutsController < ApplicationController
  # THIS MAPS to show.html.erb
  def show # maps to views > about > show.html.erb
    @user = current_user
  end
end
