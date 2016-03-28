class WelcomeController < ApplicationController
  def homepage
  end

  def homepage1
  end

  def searchbar
	@signed = Reg.find_by(id: session[:user_id])
  end	
end
