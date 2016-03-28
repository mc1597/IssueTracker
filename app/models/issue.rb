class Issue < ActiveRecord::Base
 validates_presence_of :projname, :on => :create
 validates_presence_of :author, :on => :create

  def self.search(query)
    where("projname LIKE ? OR author LIKE ?","%#{query}%","%#{query}%")
  end
end
