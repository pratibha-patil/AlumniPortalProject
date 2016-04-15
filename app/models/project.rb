class Project < ActiveRecord::Base
	belongs_to :student
	has_many :projects_requests
	has_many  :alumnis, through: :projects_requests
	validates :project_name, presence: true
	validates :details, presence: true
end
