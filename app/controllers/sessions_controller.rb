class SessionsController < ApplicationController

  def new ;end

   def create 
	 user = User.where(username: params[:username]).first
	 if user && user.authenticate(params[:password])
		session[:user_id] = user.id
		flash[:notice]= "you've logged in"
		redirect_to root_path
      else
		 flash[:error]= 'Failed to log in!'
		  redirect_to login_path
	   end
	end

	def delete
      session[:user_id] = nil
      flash[:notice]="Logged Out !"
      redirect_to root_path
	end
end