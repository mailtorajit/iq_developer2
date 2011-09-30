# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_iqdevelop_session',
  :secret      => 'c53fd2c029a3537e8f373944ab10452dfd7fee239ef89b82b6e48b4929aa139bcf18d3501e904c21afad3f29e9c428d8ee058a93d4cc329e5bfcb399ae66d347'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
