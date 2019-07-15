class AddAttachmentImageToTroubles < ActiveRecord::Migration
  def self.up
    change_table :troubles do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :troubles, :image
  end
end
