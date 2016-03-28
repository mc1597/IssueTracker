class CreateRegs < ActiveRecord::Migration
  def self.up
    create_table :regs do |t|
      t.column :username, :string
      t.column :email, :string
      t.column :password, :string
      t.column :password_confirmation, :string
      t.timestamps null: false
    end
end
 def self.down
   drop table :signups	
  end

end
