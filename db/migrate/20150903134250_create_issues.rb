class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :projname
      t.string :author	
      t.text :content
      t.string :receiver	


      t.timestamps null: false
    end
  end
end
