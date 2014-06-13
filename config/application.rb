require File.expand_path('../boot', __FILE__)

# Comment out the frameworks you don't want (if you don't want ActionMailer,
# make sure to comment out the `config.action_mailer` lines in your
# config/environments/development.rb and config/environments/test.rb files):
require 'action_controller/railtie'
require 'dm-rails/railtie'
require 'sprockets/railtie'
require 'action_mailer/railtie'
require 'active_resource/railtie'
#require 'rails/test_unit/railtie'
#require "minitest/rails/railtie"

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

# require each file from lib directory
Dir.glob("./lib/*.{rb}").each { |file| require file }

module Eds

  class Application < Rails::Application

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Custom directories with classes and modules you want to be autoloadable.
    #config.autoload_paths += %W(#{Rails.root}/lib/*)

    # Activate observers that should always be running.
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    Dir.entries("#{Rails.root}/config/routes").each do |entry|
        config.paths["config/routes"] << File.join(Rails.root, "config/routes/#{entry}") if /([^\.]{1,2})|(.*\.rb)/ =~ entry
    end

    #config.generators do |g|
    #  g.test_framework :mini_test
    #end

    #config.filter_redirect.concat [/\/*assets\/*.*/]

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"

    # Configure sensitive parameters which will be filtered from the log file.
    config.filter_parameters += :password # HAHA!!! My custom Array#+= makes it so it doesn't have to be an array!

    # Enable escaping HTML in JSON.
    config.active_support.escape_html_entities_in_json = true

    # Enforce whitelist mode for mass assignment.
    # This will create an empty whitelist of attributes available for mass-assignment for all models
    # in your app. As such, your models will need to explicitly whitelist or blacklist accessible
    # parameters by using an attr_accessible or attr_protected declaration.
    # config.active_recordwhitelist_attributes = true

    # Enable the asset pipeline
    config.assets.enabled = true
    
    # Don't log asset requests
    config.assets.logger = false

    # Version of your assets, change this if you want to expire all your assets
    config.assets.version = '1.02'
    
    #env['rack.session.options'].merge! expire_after: 2592000

    config.after_initialize do
      SESSION_EXPIRE_AFTER = 30.minutes
      Rails.application.config.session_store :cookie_store, 
            :key => rand_token, :expire_after => SESSION_EXPIRE_AFTER
    end

    config.force_ssl = false

    # config/application.rb
    config.assets.precompile << Proc.new do |path|
      if path =~ /\.(css|js)\z/
        full_path = Rails.application.assets.resolve(path).to_path
        app_assets_path = Rails.root.join('app', 'assets').to_path
        if full_path.starts_with? app_assets_path
          puts "including asset: " + full_path
          true
        else
          puts "excluding asset: " + full_path
          false
        end
      else
        false
      end
    end
  end
end
