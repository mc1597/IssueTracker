class IssueController < ApplicationController
	def newissue
		@issue = Issue.new
		@creator = Reg.find_by(id: session[:user_id])
	end
	def newupdateissue
		@issue = Issue.new
		
	end
	
	def createissue
		@issue = Issue.new(issue_params)
		if @issue.valid?
			@issue.save
			redirect_to "http://localhost:3000/homepagenew"
		else
			redirect_to :back
		end
	end

	def indexissue
		$issues = Issue.all
		@signed = Reg.find_by(id: session[:user_id])
		 if params[:search]
                        $issues = Issue.search(params[:search]).order("created_at DESC")
                else
                        $issues = Issue.all.order('created_at DESC')
                end

	end
	
	def updateissue
		@issue = Issue.new(issue_params)
		projname = params[:issue][:projname]
		author = params[:issue][:author]
		content = params[:issue][:content]
		receiver = params[:issue][:receiver]
		person = Reg.find_by(username: author)

		check = Issue.find_by(projname: projname,author: author)
		if check
			if person and session[:user_id] == person.id and params[:commit] == 'Delete Issue'
			check.destroy
			redirect_to "http://localhost:3000/homepagenew"
			elsif params[:commit] == 'Edit Content'
			check.content = content
			check.save
			redirect_to "http://localhost:3000/homepagenew"
			end
		else
			redirect_to :back
		end
		end
	private
		def issue_params
			params.require(:issue).permit(:projname, :author, :content, :receiver)	
	end
end

