# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
#DataMapper.setup(:default, 'sqlite::memory:')
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'


# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("lib/*.rb")].each { |f| require f }
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
#Dir[Rails.root.join("app/models/*.rb")].each { |f| require f }


RSpec.configure do |config|
  # ## Mock Framework
  #
  # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
  #
  # config.mock_with :mocha
  # config.mock_with :flexmock
  # config.mock_with :rr

  config.render_views

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  #config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  #config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = "random"
end

shared_examples "request" do |req_type:"GET", page:, desc:, status: 200, params:{}, session:{}, **other_params|
  describe "\n\t#{req_type} #{described_class}/#{page}   #{desc}:" do
    before :each do
      case req_type
      when "GET"
        get page, params, session
      when "POST"
        post page, params, session
      when "PUT"
        put page, params, session
      when "PATCH"
        patch page, params, session
      when "DELETE"
        delete page, params, session
      end
    end

    it "has a status #{status}" do
      expect(response.status).to eq(status)
    end

    pending "should not result in an error" do

    end

=begin
    it "should render template :#{page}" do
      expect(response).to render_template(page)
    end
=end

    it "should have a response body" do
      expect(response.body).not_to(eq(""))
    end
  end
end


#require 'datamapper'
#DataMapper.auto_migrate!