class FixTypoInAbstractContentType < ActiveRecord::Migration
  def self.up
    remove_column :registrations, :absctract_content_type
    add_column :registrations, :abstract_content_type, :string
  end

  def self.down
      add_column :registrations, :absctract_content_type
      remove_column :registrations, :abstract_content_type, :string
  end
end
