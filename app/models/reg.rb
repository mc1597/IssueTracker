class Reg < ActiveRecord::Base
 # attr_accessor :username, :email, :password
  validates_confirmation_of :password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_presence_of :username, :on => :create
  validates_presence_of :password, :on => :create
  validates :password, length: { minimum: 6 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false } 
  validates_uniqueness_of :email
  validates_uniqueness_of :username

  def self.search(query)
    where("username LIKE ? OR email LIKE ?","%#{query}%","%#{query}%")
  end

  def self.authenticate_by_email(email, password)
    user = find_by_email(email)
    if Reg.where(email: email,password: password).exists?(conditions = :none)
      user
    else
      nil
    end
  end
  def self.authenticate_by_user(username, password)
    user = find_by_username(username)
    if Reg.where(username: username,password: password).exists?(conditions = :none)
      user
    else
      nil
    end
  end
end
