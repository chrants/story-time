# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
#use Rack::Attack
#Rack::Attack.cache.store = ActiveSupport::Cache::MemoryStore.new # defaults to Rails.cache
run Eds::Application
