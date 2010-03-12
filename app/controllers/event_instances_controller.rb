class EventInstancesController < ApplicationController
  # GET /event_instances
  # GET /event_instances.xml
  def index
    @event_instances = EventInstance.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @event_instances }
    end
  end

  # GET /event_instances/1
  # GET /event_instances/1.xml
  def show
    @event_instance = EventInstance.find(params[:id])

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
end
