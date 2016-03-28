class CreateProjectmembers < ActiveRecord::Migration
  def change
    create_table :projectmembers do |t|
	t.string :mname
	t.string :pname

      t.timestamps null: false
    end
  end
end
