class SearchBoxController < ApplicationController
  before_filter :remember_criteria

  def view
    render :partial => 'view'
  end

  def search
    # delete any existing remembered search
    session.delete(:event_instance_search)
    # pass the search onto the event_instances controller
    session[:event_instance_search] = @search_box
    redirect_to(:controller => 'event_instances', :action => 'search')
  end

  private

  def remember_criteria
    # Put what the user selected into a instance variable for use in views
    @search_box = params[:search_box]

    # Make sure only to store a valid integer for genre and category
    begin
      @search_box[:category_id_equals] = Integer(@search_box[:category_id_equals])
      if @search_box[:category_id_equals] == 0
        @search_box[:category_id_equals] = nil
      end
    rescue
      @search_box[:category_id_equals] = nil
    end
    begin
      @search_box[:genre_id_equals] = Integer(@search_box[:genre_id_equals])
      if @search_box[:genre_id_equals] == 0
        @search_box[:genre_id_equals] = nil
      end
    rescue
      @search_box[:genre_id_equals] = nil
    end

    # remember what the user selected by storing it in the session object
    session[:search_box] = @search_box
  end
end
