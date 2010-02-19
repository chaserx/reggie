# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_reggie_session',
  :secret      => '3042f65c9add95fc6fa2e5ce4d81593e29a1c21df8212a5943c46bafcd029db60a16217eb60db9f244bc276be0a98646dbc3b4a093729d35d59c4cbd1a63b6f7'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
