class SearchBoxController < ApplicationController
  before_filter :remember_criteria

  def view
    render :partial => 'view'
  end

  def search
    # pass the search onto the event_instances controller
    session[:event_instance_search] = @search_box
    redirect_to(:controller => 'event_instances', :action => 'search')
  end

  private

  def remember_criteria
    # Put what the user selected into a instance variable for use in views
    @search_box = params[:search_box]

    # remember what the user selected by storing it in the session object
    session[:search_box] = @search_box
  end
end
