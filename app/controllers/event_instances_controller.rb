class EventInstancesController < ApplicationController
  # GET /event_instances
  # GET /event_instances.xml
  def index
  end

  # GET /event_instances/search
  # GET /event_instances/search.xml
  def search
    @category_id = params[:category_id]

    if @category_id.nil?
      # Either we are receiving criteria from the user or remembering what was stored in the session
      search_criteria = params[:search]
      if search_criteria.nil?
        # Get defaults saved in the user session
        search_criteria = session[:event_instance_search]

        # if there is nothing in the session then make something up to prevent crash
        if search_criteria.nil?
          search_criteria = {:category_id_equals => Category.find(:first).id}
        end
      else
        # remember what the user selected by storing it in the session object
        session[:event_instance_search] = search_criteria
      end
      @category_id = search_criteria[:category_id_equals]
    else
      # Build search_criteria using passed in @category_id
      search_criteria = {:category_id_equals => @category_id}
    end

    if search_criteria[:genre_id_equals] == "0"
      search_criteria.delete(:genre_id_equals)
    end

    @search = EventInstance.search(search_criteria)
  end

  # GET /event_instances/1
  # GET /event_instances/1.xml
  def show
    @event_instance = EventInstance.find(params[:id])
    #to render the posts within event_instances
    @post = Post.new
    #find all comments for an event
    @event_id = params[:id]
    @posts = Post.find(:all, :conditions => [ "event_instances_id = ?", @event_id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @event_instance }
    end
  end

  # GET /event_instances/new
  # GET /event_instances/new.xml
  def new
    @event_instance = EventInstance.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event_instance }
    end
  end

  # GET /event_instances/1/edit
  def edit
    @event_instance = EventInstance.find(params[:id])
  end

  # POST /event_instances
  # POST /event_instances.xml
  def create
    @event_instance = EventInstance.new(params[:event_instance])

    respond_to do |format|
      if @event_instance.save
        flash[:notice] = 'EventInstance was successfully created.'
        format.html { redirect_to(@event_instance) }
        format.xml  { render :xml => @event_instance, :status => :created, :location => @event_instance }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event_instance.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /event_instances/1
  # PUT /event_instances/1.xml
  def update
    @event_instance = EventInstance.find(params[:id])

    respond_to do |format|
      if @event_instance.update_attributes(params[:event_instance])
        flash[:notice] = 'EventInstance was successfully updated.'
        format.html { redirect_to(@event_instance) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event_instance.errors, :status => :unprocessable_entity }
      end
    end
  end

  def genre_dropdown
    # renders a genre selection dropdown for use with ajax
    args={}
    if params[:id].nil?
      # Must be for search screen get settings from params
      category_id = params[:category_id]
      if category_id == "" then category_id = nil end
    else
      # Specific event_instance so get settings from self
      category_id = EventInstance.find(params[:id]).category_id
    end
    args[:name] = "genre_id" #params[:name] || "genre_id"
    if category_id.nil?
      category_id = Category.first.id
    end
    args[:collection] = Genre.find_all_by_category_id(category_id)
    render :partial => "shared/dropdown", :locals => args
  end

  # DELETE /event_instances/1
  # DELETE /event_instances/1.xml
  def destroy
    
    @event_instance = EventInstance.find(params[:id])
    @event_instance.destroy

    respond_to do |format|
      format.html { redirect_to(event_instances_url) }
      format.xml  { head :ok }
    end
  end

  def rate
    @event_instance = EventInstance.find(params[:id])
    @event_instance.rate(params[:stars], current_user, params[:dimension])
    render :update do |page|
      page.replace_html @event_instance.wrapper_dom_id(params), ratings_for(@event_instance, params.merge(:wrap => false))
      page.visual_effect :highlight, @event_instance.wrapper_dom_id(params)
    end
  end
end
