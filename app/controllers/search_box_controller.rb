class SearchBoxController < ApplicationController
  before_filter :remember_criteria

  def view
    render :partial => 'view'
  end

  def search
    unless session[:search_box].nil?
      # pass the search onto the event_instances controller
      session[:event_instance_search] = @search_box
      render(:update) { |page| page.redirect_to :controller => 'event_instances', :action => 'search' }
    else
      render :partial => 'view'
    end
  end

  private

  def remember_criteria
    # Put what the user selected into a instance variable for use in views
    @search_box = params[:search_box]

    # remember what the user selected by storing it in the session object
    session[:search_box] = @search_box

    session.delete :search_box if session[:search_box][:category_id_equals].nil? ||
        session[:search_box][:category_id_equals] == "0"
  end
end
