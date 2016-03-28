class ProjectnameController < ApplicationController
	def newproject
		@creator = Reg.find_by(id: session[:user_id])
		@proj = Projectname.new
	end

	def createproject
		@proj = Projectname.new(proj_params)
		@creator = Reg.find_by(id: session[:user_id])
		title = params[:proj][:title]
	#	members = params[:proj][:members]
	        	
		if @proj.valid?
			@proj.save
	#       	newmember = Projectmember.new	
	#		newmember.mname = members
	#		newmember.pname = title
	#		newmember.save
			redirect_to :root
		else
			redirect_to :back
		#	render :action => "newproject"
		end
	end
	def indexproject
		$projects = Projectname.all
		@signed = Reg.find_by(id: session[:user_id])
		if params[:search]
			$projects = Projectname.search(params[:search]).order("created_at DESC")
		else
			$projects = Projectname.all.order('created_at DESC')
		end
			
		#if $projects.present?
		#	$projects.each do |a|
		#	mem = Projectmember.where(pname: a.title).all
		#	string = ""
		#		if mem.present?
		#			mem.each do |m|
		#				if string == ""
		#					string = m.mname
		#				else
		#					string = string + "," + m.mname
		#				end
		#			end
		#		end
		#	a.members = string
		#	a.save
		#	end
		#end
	end

	private
	 	def proj_params
                	params.require(:proj).permit(:title, :owner, :description, :members, :settings)
  	   	end
end
