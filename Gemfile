# Set the ruby version required to run.
#ruby '2.1.1'
##############################################

# Set the gem source - RubyGems
source 'https://rubygems.org'
source 'https://rails-assets.org'

# Set versions
RAILS_VERSION = '~> 3.2.15'
DM_VERSION    = '~> 1.2.0'

gem 'activesupport',  		RAILS_VERSION,
							:require => 'active_support'
gem 'actionpack',     		RAILS_VERSION,
							:require => 'action_pack'
gem 'actionmailer',   		RAILS_VERSION,
							:require => 'action_mailer'
gem 'activeresource', 		RAILS_VERSION,
							:require => 'active_resource'
gem 'railties',       		RAILS_VERSION,
							:require => 'rails'

gem 'tzinfo'#,         		'~> 0.3.32'


gem 'dm-rails',      		DM_VERSION

# You can use any of the other available database adapters.
# This is only a small excerpt of the list of all available adapters
#  http://wiki.github.com/datamapper/dm-core/adapters
#  http://wiki.github.com/datamapper/dm-core/community-plugins

# gem 'dm-sqlite-adapter',    DM_VERSION
# gem 'dm-mysql-adapter',     DM_VERSION
# gem 'dm-postgres-adapter',  DM_VERSION
# gem 'dm-oracle-adapter',    DM_VERSION
# gem 'dm-sqlserver-adapter', DM_VERSION

gem 'dm-migrations',   		DM_VERSION
gem 'dm-types',        		DM_VERSION
gem 'dm-validations',  		DM_VERSION
gem 'dm-constraints',  		DM_VERSION
gem 'dm-transactions', 		DM_VERSION
gem 'dm-aggregates',   		DM_VERSION
gem 'dm-timestamps',   		DM_VERSION
gem 'dm-observer',     		DM_VERSION
gem 'dm-ar-finders',   		DM_VERSION
gem 'dm-adjust',			    DM_VERSION
#gem 'dm-is-searchable',   DM_VERSION
#gem 'dm-is-list',	   		  DM_VERSION
#gem 'dm-is-tree',	   		  DM_VERSION
gem 'dm-is-versioned', 		DM_VERSION
#gem 'dm-is-remixable', 		DM_VERSION

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass'
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'coffee-script-source', '1.5.0'
  gem 'uglifier'
end

gem 'rails-assets-bootstrap'

gem 'sitemap_generator'

gem 'client_side_validations'

gem 'thin'

group :test, :development do
  # Pretty printed test output
  #gem 'turn', '~> 0.9.4', :require => false
  gem 'sqlite3'
  gem 'binding_of_caller'
  gem 'dm-sqlite-adapter'
  #gem 'debugger'
  gem 'capybara'
  gem 'rspec-rails', '~> 2.14'
  
  gem 'database_cleaner'

  gem 'better_errors'
end

group :production do
  gem 'rails_12factor'
  gem 'pg'
  gem 'dm-postgres-adapter'
end

gem 'awesome_print'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
