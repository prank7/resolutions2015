class UsersController < ApplicationController
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
		
	end

	def user_params
    params.require(:user).permit(resolutions_attributes: [:id, :name, :_destroy])
  end

end