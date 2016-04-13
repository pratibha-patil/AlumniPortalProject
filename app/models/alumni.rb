class Alumni < ActiveRecord::Base
	has_secure_password
	has_many :articles
	has_many :project_requests
	has_many  :projects, through: :project_requests
	validates :password_digest, presence: true,
                    length: { minimum: 5 }
    validates :username, presence: true,
                    length: { minimum: 5 }

     has_attached_file :image
validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
