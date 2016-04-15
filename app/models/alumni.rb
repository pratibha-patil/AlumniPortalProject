class Alumni < ActiveRecord::Base
	has_secure_password
	has_many :articles
	has_many :project_requests
	has_many  :projects, through: :project_requests
	validates :password, presence: true,
                    length: { minimum: 5 }
    validates :username, presence: true,
                    length: { minimum: 5 }
     validates :first_name,presence: true
     validates :last_name,presence: true
     validates :email,presence: true
     validates_uniqueness_of :email
     has_attached_file :image
validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
    
    def self.search(search)
      arel = order('created_at DESC') # note: default is all, just sorted
      arel = arel.where('first_name LIKE ? OR last_name LIKE ? OR company LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%").order('created_at DESC') if search.present?

      if arel.first
         arel
      else
        all
      end
    end
end
