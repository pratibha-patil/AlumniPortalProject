class Project < ActiveRecord::Base
	belongs_to :student
	has_many :projects_requests
	has_many  :alumnis, through: :projects_requests
end
