class CreateProjectmembers < ActiveRecord::Migration
  def change
    create_table :projectnames do |t|
	t.string :title
	t.string :owner
	t.text :description
	t.string :settings
      t.timestamps null: false
    end
    create_table :teammembers do |t|
	t.string :name

      t.timestamps null: false
    end
    create_table :projectmembers do |t|
	t.belongs_to :projectname, index: true
	t.belongs_to :teammember, index: true
    end
  end
end
