require 'dm-rails/middleware/identity_map'
class ApplicationController < ActionController::Base

  include ApplicationHelper

  # Unless Rails is on localhost raise fancy error pages.
  unless Rails.application.config.consider_all_requests_local
    rescue_from Exception, :with => :render_error
    rescue_from ActionController::RoutingError, :with => :render_not_found
  end

  #render 500 error 
  def render_error(e)
    Rails.logger.error e.message
    e.backtrace.each do |i|
      Rails.logger.error i
    end
    respond_to do |f| 
      f.html{ redirect_to "/errors/500.html", :status => 500 }
      f.js{ render :partial => "errors/ajax_500.html", :status => 500 }
    end
  end
  
  #render 404 error 
  def render_not_found(e)
    Rails.logger.error e.message
    e.backtrace.each do |i|
      Rails.logger.error i
    end
    respond_to do |f| 
      f.html { 
        redirect_to "/errors/404.html", :status => 404 
      }
      f.js   { 
        render :partial => "/errors/ajax_404.html", :status => 404 
      }
    end
  end
 
  # Called by last route matching unmatched routes.  
  # Raises RoutingError which will be rescued from in the same way as other exceptions.
  def raise_not_found!
    raise ActionController::RoutingError.new("No route matches #{params[:unmatched_route]}")
  end


  use Rails::DataMapper::Middleware::IdentityMap

  protect_from_forgery
  
  # Uncomment if using SSL on all pages.
  #force_ssl

  # A very small library for logging.
  # Needs revision in the long run.
  include MyRailsDebugger
  # A library I built to handle responding to js and other fairly.
  include AjaxHelpers

  before_filter :before_init
  before_filter :init_user
  before_filter 'check_credentials(:public)'
  before_filter :set_session

  @@development = ENV['RAILS_ENV'].downcase != 'production'

  def logged_in?
    @user || User.first(token: session[:user]) != nil
  end

  def premium?
    member = Member.first(token: session[:user]) || Admin.first(token: session[:user])
    @member || member != nil
  end

  protected

  def before_init
    assert request
    assert request.fullpath

    @address = request.fullpath
  end

  def init_user
    @user = User.first(token: session[:user])
    if @user
      @admin = @user if @user.type == Admin
    end
  end

  def check_credentials level
    init_user unless @user

    case level
    when :public
      ;
    when :user
      unless @user || @admin
        alert_unauthorized(level, @address)
        redirect_to home_url
      end
    when :admin
      unless @admin
        alert_unauthorized(level, @address)
        redirect_to home_url
      end
    end
  end

  def alert_unauthorized(level, address)
    alert {"[@#{address}] Unauthorized attempt to access #{level.to_s} content"}
  end

  def set_session
    #session[:user]
  end

end
