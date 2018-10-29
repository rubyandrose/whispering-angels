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
  	if current_user.update! user_params
      flash[:success] = "Yay! You did it!"
      redirect_to about_path
    else
      render :edit
    end
  end

  private

  def user_params
  	params.require(:user).permit([:favorite_wine, :favorite_movie, :about_me])
  end
end
