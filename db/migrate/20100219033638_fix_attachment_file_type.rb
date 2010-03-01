class FixAttachmentFileType < ActiveRecord::Migration
  def self.up
    remove_column :registrations, :abstract_file_type
    add_column :registrations, :absctract_content_type, :string
  end

  def self.down
    add_column :registrations, :abstract_file_type, :string
    remove_column :registrations, :absctract_content_type
  end
end
