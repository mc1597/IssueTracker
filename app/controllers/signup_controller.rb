class SignupController < ApplicationController

	def sign_in
		@user = Reg.new
	end

	def login
		
		@user = Reg.new(user_params)
		user_or_email = params[:user][:username]
		password = params[:user][:password]
	
		if user_or_email.rindex('@')
			email = user_or_email
			user = Reg.authenticate_by_email(email,password)
		else
			username = user_or_email
			user = Reg.authenticate_by_user(username,password)	
		end

		if user
			session[:user_id]=user.id
			redirect_to "http://localhost:3000/homepagenew"
		else
			redirect_to :back
		end
	end
	
	def sign_out
		@signed = Reg.find_by(id: session[:user_id])
		session[:user_id]=""
	end
	def log_out
		redirect_to :'sign_in'
	end

	private
	 	def user_params
                	params.require(:user).permit(:username, :password)
  	   	end


end
