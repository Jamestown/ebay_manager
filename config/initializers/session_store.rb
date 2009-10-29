# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_ebay_manager_session',
  :secret      => '53a1aa31119ea04dee2fac94e5f1d250cc18c99746865778005b02bf2df1e72fbc32475ffb431ad2215048f68ae785fca34a26fd2dba196dbae81db0468ed3b1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
