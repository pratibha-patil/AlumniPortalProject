class CreateProjectRequests < ActiveRecord::Migration
  def change
    create_table :project_requests do |t|
    	t.belongs_to :project, index: true
    	t.belongs_to :alumni, index: true
    	t.string :status
      t.timestamps
    end
  end
end
