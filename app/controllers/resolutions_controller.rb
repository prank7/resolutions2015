class ResolutionsController < ApplicationController
	def new
		@user = current_user
		@user = current_user.resolutions.build if current_user.resolutions.blank?
	end

	def create
		resolution  = Resolution.create(name: params[:resolution][:name], user_id: current_user.id)
	end

end
