class Projectname < ActiveRecord::Base
	
  validates_presence_of :title, :on => :create
  validates_presence_of :owner, :on => :create
  validates_presence_of :description, :on => :create
#  validates_presence_of :members, :on => :create
  validates_presence_of :settings, :on => :create

	
  def self.search(query)
	#if name == '1'
    	#	where("title LIKE ?","%#{query}%")
	#end
	#if creator == '1'
    	#	where("owner LIKE ?","%#{query}%")
	#end
	#if member == '1'
    	#	where("member LIKE ?","%#{query}%")
	#end
	#if all == '1'
	    where("title LIKE ? OR owner LIKE ? OR members LIKE ?","%#{query}%","%#{query}%","%#{query}%")
	#end
  end

  def self.can_update(owner, title, members)
    user = find_by_owner(owner)
    if Projectname.where(owner: owner,title: title).exists?(conditions = :none)
        user
    else
        nil
    end
end

end
