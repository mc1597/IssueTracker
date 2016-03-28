class CreateProjectnames < ActiveRecord::Migration
  def change
    create_table :projectnames do |t|
      t.column :title, :string
      t.column :owner, :string
      t.column :description, :text
      t.column :members, :string
      t.column :settings, :string

      t.timestamps null: false
    end
  end
end
