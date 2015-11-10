# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!

ENV["SSL_CERT_FILE"] = "/Users/vivekgahunia/.rvm/rubies/ruby-2.2.3/lib/ruby/2.2.0/rubygems/ssl_certs/cacert.pem"
