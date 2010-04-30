class UserSessionsController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => :destroy
  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user

  def new
    session[:user_session] = params[:user_session]
    #redirect_to(:controller => 'user_sessions', :action => 'create')
  end

  def create
    @user_session = UserSession.new(session[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_back_or_default account_url
    else
      flash[:notice] = "Login failed"
      redirect_to(:controller => 'event_instances', :action => 'index')
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "logout successful"
    redirect_back_or_default new_user_session_url
  end

  private

  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
end