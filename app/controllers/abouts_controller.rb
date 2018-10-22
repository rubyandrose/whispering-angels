class AboutsController < ApplicationController
  # THIS MAPS to show.html.erb
  def show # maps to views > about > show.html.erb
    @user = current_user
  end
  def edit 
  	@user = current_user
  end
  def update
  	# puts params[:user]
  	current_user.update! params[:user]
  end

  private

  def user_params
  	params.permit(:user)
  end
end
