class Student < ActiveRecord::Base
	has_secure_password
	validates :password, length: { minimum: 6, maximum: 20 }

	has_many :projects,dependent: :destroy
	validates :password_digest, presence: true,
                    length: { minimum: 5 }
    validates :username, presence: true,
                    length: { minimum: 5 }
    validates_uniqueness_of :email
     has_attached_file :image
     validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
