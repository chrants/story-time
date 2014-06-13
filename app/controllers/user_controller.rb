class UserController < ApplicationController

  WARN_EMAIL_ALREADY_CONFIRMED = 
    { class: 'warning', message: 'That email has already been confirmed.' }

  ERR_CREATING_ACCOUNT = 
    { class: 'error', message: 'Error creating your account.' }
  ERR_ACTIVATION_EMAIL_NOT_SENT = 
    { class: 'error', message: 'Account Successfully Created, but confirmation email has not been sent!' }
  ERR_INVALID_EMAIL = 
    { class: 'error', message: "Invalid email!" }
  ERR_LOGIN = 
    { class: 'error', message: 'Invalid Username or Password!' }

  before_filter 'check_credentials(:user)',
    only: [:home, :profile, :logout]

  # GET
  # Email Confirmation Page
  # @param [Hash] params
  #   @option params [String, Number] :token
  #   @option params [String, Number] :email
  def show_confirm_email
    assert params[:token] and params[:email]

    user = User.first(token: params[:token])
    
    if Email.get(params[:email]) and Email.get(params[:email]).confirmed
      @alert = WARN_EMAIL_ALREADY_CONFIRMED
    else
      email = Email.get(params[:email])
      if email.user == user
        assert user

        email.confirmed = true
        
        if user.confirmed
          if email.save
            @alert={class: 'success', message: "Successfully confirmed email #{params[:email]}."}
          else
            @alert={class: 'error', message: "Error confirming email #{params[:email]}!"}
          end
        else
          user.confirmed = true
          if email.save and user.save
            @alert={class: 'success', message: "Successfully confirmed email #{params[:email]} and user #{user.name}."}
          else
            @alert={class: 'error', message: 'Error confirming email and user!'}
          end
        end

      else #Email does not match
        @alert = ERR_INVALID_EMAIL
      end
    end
  end


  # GET
  # Welcome Page
  # @param [Hash] params
  def welcome

  end


  # GET
  # User Home Page
  # @param [Hash] params
  def home
    unless @user.confirmed
      render_redirect('/user/welcome')
    end
  end


  # GET
  # Profile Page
  # @param [Hash] params
  def profile; end

  def view_topics
    Subject.all(name: params[:subjects]) #Will this work?
  end


  # GET
  # Sign Up Page
  # @param [Hash] params
  def show_signup
    putsy @alert, params[:alert]
    @user = User.new
    @alert ||= flash[:alert]
  end


  # GET
  # Login Page
  # @param [Hash] params
  def show_login

  end


  # GET
  # Logout User
  # Redirects user home and sets session[:user] to nil
  # @param [Hash] params
  def logout
    session[:user] = nil

    refute session[:user]

    redirect_to controller: 'public', action: :'index'
  end


  # POST '/login'
  # Login
  # @param [Hash] params
  #   @option params [String] :email
  #   @option params [String] :password
  def login
    email = Email.get(params[:email])
    user = email.user if email
    # Login if user's password matches the provided
    if user and user.password == params[:password]
      session[:user] = user.token
      assert session[:user]
      render_redirect(home_url user)
    else
      render_alert(ERR_LOGIN)
    end
  end


  # POST '/signup'
  # Signup
  # @param [Hash] params
  #   @option params [String] :email
  #   @option params [String] :name
  #   @option params [String] :city
  #   @option params [String] :email
  #   @option params [String] :school_name
  #   @option params [String, Number] :zip_code
  #   @option params [String] :password
  def signup
    user_hash = params.only('name', 'password', 'city', 'state', 'zip_code')

    if Email.get(params[:email])
      flash[:alert]={class: 'warning', message: 'A user with this email already exists.'}
    else
      email = Email.new(name: params[:email])
      user_hash.plus!(token: rand_token)
      user = User.create! user_hash
      user.emails << email
      putsy user.attributes, user.save

      assert user.save
      
      begin
        
        user.update( created: true )
        session[:user] = user.token
        begin
          UserMailer.welcome_email(user).deliver
        rescue => e
          Rails.logger.error e
          #@alert={class: 'error', message: 'Account Successfully Created, but confirmation email has not been sent!'}
        end

        assert user.emails and user.emails.size > 0

        render_redirect('/user/welcome')
        return

      rescue => e
        assert user.destroy! if user
        assert email.destroy! if email

        #@alert={class: 'error', message: 'Error creating your account.'}
        flash[:alert] = ERR_CREATING_ACCOUNT
        
        putsy user.errors.inspect, e
      end 
    end
    
    render_redirect '/user/signup'
  end 
end