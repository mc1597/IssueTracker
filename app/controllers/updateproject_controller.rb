class UpdateprojectController < ApplicationController

	def newupdate
		@maker = Reg.find_by(id: session[:user_id])
		@proj = Projectname.new
	end	

	def update
		@proj = Projectname.new(proj_params)
		owner = params[:proj][:owner]
		title = params[:proj][:title]
		members = params[:proj][:members]
	        person = Reg.find_by(username: owner)
	        check = Projectmember.find_by(mname: members,pname: title)

	      	if person and session[:user_id] == person.id 
		proj = Projectname.find_by(owner: owner,title: title)
			if proj
			string = proj.members
			#proj.members = members
			#proj.save
				if params[:commit] == 'Add Member'
	        		newmember = Projectmember.new	
				newmember.mname = members
				newmember.pname = title
				newmember.save
				if string == ""
					string = members
				else
					string = string + "," + members
					
				end
				proj.members = string
				proj.save
				redirect_to "http://localhost:3000/homepagenew"
				elsif params[:commit] == 'Delete Member'
				check.destroy	
				redirect_to "http://localhost:3000/homepagenew"
				end
			else
			redirect_to :back
			end
		else
		redirect_to :back
		end
	end

	private
	 	def proj_params
                	params.require(:proj).permit(:title, :owner, :members)
  	   	end
end
