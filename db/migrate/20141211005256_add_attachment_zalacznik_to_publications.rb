class AddAttachmentZalacznikToPublications < ActiveRecord::Migration
  def self.up
    change_table :publications do |t|
      t.attachment :zalacznik
    end
  end

  def self.down
    remove_attachment :publications, :zalacznik
  end
end
