class CreateSignups < ActiveRecord::Migration
  def self.up
    create_table :signups do |t|
      t.column :username, :string
      t.column :email, :string
      t.column :password, :string
      t.column :password_confirmation, :string
    end
end
 def self.down
   drop table :signups	
  end
end
