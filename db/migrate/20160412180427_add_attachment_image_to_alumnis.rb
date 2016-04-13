class AddAttachmentImageToAlumnis < ActiveRecord::Migration
  def self.up
    change_table :alumnis do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :alumnis, :image
  end
end
