class AddCachedSlugStringToRegistration < ActiveRecord::Migration
  def self.up
    add_column :registrations, :cached_slug, :string
  end

  def self.down
    remove_column :registrations, :cached_slug
  end
end
