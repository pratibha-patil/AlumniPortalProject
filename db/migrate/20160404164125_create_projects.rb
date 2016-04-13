class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    	t.string :project_name
	    t.string :details
	    t.references :student, index: true,foreign_key: true
        t.timestamps
    end
  end
end
