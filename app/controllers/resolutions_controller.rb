class ResolutionsController < ApplicationController
	def new
		@resolution = Resolution.new
	end

	def create
		resolution  = Resolution.create(name: params[:resolution][:name], user_id: current_user.id)
	end

end
