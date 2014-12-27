class UsersController < ApplicationController
	before_action :redirect_unless_signed_in, only: [:new_resolution, :resolution_create]
	
	def new_resolution
		@user = current_user
		if current_user.resolutions.blank?
			10.times {@user.resolutions.build }
		else
			(10-current_user.resolutions.count).times {@user.resolutions.build}
		end
		@user
	end

	def resolution_create
		@user = User.find current_user.id
	  if @user.update(user_params)
	  	redirect_to user_path(current_user)
	  else
	  	redirect_to resolution_page_path
	  end
	end

	def show
		@user = User.find(params[:id])
	end

private
	def user_params
    params.require(:user).permit(:notification, resolutions_attributes: [:id, :name, :_destroy])
  end

end
