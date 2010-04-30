class LoginBoxController < ApplicationController
  before_filter :remember_state

  def view
    render :partial => 'view'
  end

  def login
    # pass the search onto the event_instances controller
    session[:user_sessions] = @login_box
    redirect_to(:controller => 'user_sessions', :action => 'new')
  end

  private

  def remember_state
    # Put what the user selected into a instance variable for use in views
    @login_box = params[:login_box]

    # remember what the user selected by storing it in the session object
    session[:login_box] = @login_box
  end
end
