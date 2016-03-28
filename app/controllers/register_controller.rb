class RegisterController < ApplicationController
	def new_user
		@user = Reg.new
	end

	def sign_up
		@user = Reg.new(user_params)
		username = params[:user][:username]
		email = params[:user][:email]
		password = params[:user][:password]
		
		if @user.valid?
			@user.username = username
			@user.email = email
			@user.password = password
			if @user.save
				#session[:user_id] = @user.id
				#UserMailer.welcome_email(@user).deliver_later
			        redirect_to "http://localhost:3000/sign_in"

			else
			        redirect_to :back
			end
		else
			redirect_to :back
		#	render :action => "newproject"
		end
	end
 	
	def index
		$users = Reg.all
		@signed = Reg.find_by(id: session[:user_id])
		if params[:search]
			$users = Reg.search(params[:search]).order("created_at DESC")
		else
			$users = Reg.all.order('created_at DESC')
		end
	end
	private
	 	def user_params
                	params.require(:user).permit(:username, :email, :password, :password_confirmation)
  	   	end
end
