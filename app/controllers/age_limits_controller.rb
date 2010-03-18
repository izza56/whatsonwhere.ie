class AgeLimitsController < ApplicationController
  # GET /age_limits
  # GET /age_limits.xml
  def index
    @age_limits = AgeLimit.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @age_limits }
    end
  end

  # GET /age_limits/1
  # GET /age_limits/1.xml
  def show
    @age_limit = AgeLimit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @age_limit }
    end
  end

  # GET /age_limits/new
  # GET /age_limits/new.xml
  def new
    @age_limit = AgeLimit.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @age_limit }
    end
  end

  # GET /age_limits/1/edit
  def edit
    @age_limit = AgeLimit.find(params[:id])
  end

  # POST /age_limits
  # POST /age_limits.xml
  def create
    @age_limit = AgeLimit.new(params[:age_limit])

    respond_to do |format|
      if @age_limit.save
        flash[:notice] = 'AgeLimit was successfully created.'
        format.html { redirect_to(@age_limit) }
        format.xml  { render :xml => @age_limit, :status => :created, :location => @age_limit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @age_limit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /age_limits/1
  # PUT /age_limits/1.xml
  def update
    @age_limit = AgeLimit.find(params[:id])

    respond_to do |format|
      if @age_limit.update_attributes(params[:age_limit])
        flash[:notice] = 'AgeLimit was successfully updated.'
        format.html { redirect_to(@age_limit) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @age_limit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /age_limits/1
  # DELETE /age_limits/1.xml
  def destroy
    @age_limit = AgeLimit.find(params[:id])
    @age_limit.destroy

    respond_to do |format|
      format.html { redirect_to(age_limits_url) }
      format.xml  { head :ok }
    end
  end
end
