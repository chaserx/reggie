class AddSaltTokenToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :password_salt, :string
    add_column :users, :persistence_token, :string
    add_column :users, :login_count, :integer, :default => 0, :null => false
    
    add_column :users, :last_request_at, :datetime
    add_column :users, :last_login_at, :datetime
    add_column :users, :current_login_at, :datetime
    add_column :users, :last_login_ip, :string
    add_column :users, :current_login_ip, :string
    
    add_index :users, :username
    add_index :users, :persistence_token
    add_index :users, :last_request_at
  end

  def self.down
    remove_column :users, :login_count
    remove_column :users, :persistence_token
    remove_column :users, :password_salt
    
    remove_column :users, :last_request_at
    remove_column :users, :last_login_at
    remove_column :users, :current_login_at
    remove_column :users, :last_login_ip
    remove_column :users, :current_login_ip
    
    remove_index :users, :login
    remove_index :users, :persistence_token
    remove_index :users, :last_request_at
  end
end
