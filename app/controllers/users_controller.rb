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
		image_process(params[:id])
		@user = User.find_by(id: params[:id]) or not_found
	end

private
	def user_params
    params.require(:user).permit(:notification, resolutions_attributes: [:id, :name, :_destroy])
  end


	def image_process(id)
		if User.where(id: id).present?
		  @user = User.find(id)
			require 'rubygems' 
			require 'mini_magick' 
			image_no = rand(1..16) 
			img = MiniMagick::Image.open(Rails.root.join("app/assets/images/grad/image#{image_no}.jpg"))

			resolutions = [] 
			Resolution.where(user_id: @user.id).each {|p| resolutions << p.name} 
			 r = "" 
			resolutions.each{|resolution| r+="\n#{resolution}"} 

			img.combine_options do |c|
			  c.gravity 'NorthWest'
			  c.annotate "0,0,250,20", "#{@user.firstname}'s Resolutions"
			  c.draw "text 60,30 '#{r}'"
			  c.font "#{::Rails.root}/public/Montserrat-Bold.ttf"
			  c.pointsize "42"
			  c.kerning '0'
			  c.fill "#FFFFFF"
			end 
			img.write(Rails.root.join("app/assets/images/users/#{@user.uid}.jpg"))
		else
			false
		end
	end

end