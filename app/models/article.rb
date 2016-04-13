class Article < ActiveRecord::Base
	belongs_to :alumni
	has_many :comments,
    dependent: :destroy
    has_attached_file :image
validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
