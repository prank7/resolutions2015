class SessionsController < ApplicationController
	skip_before_action :verify_authenticity_token 

	def create
    auth = request.env['omniauth.auth']
    user = User.find_with_omniauth(auth)
    unless user
     user = User.create_with_omniauth(auth)
     new_user = true
    end
    session[:user_id] = user.id
    current_user = user
    if new_user
      redirect_to new_year_resolution_path
    else
      redirect_to '/'
    end
    # render json: auth
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
