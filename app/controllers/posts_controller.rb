class PostsController < ApplicationController
def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    #@event_instance = EventInstance.find(params[:id])
    #redirect_to @event_instance
  end

  def create
    @post = Post.new(params[:post])
    
    if @post.save
      flash[:notice] = "Successfully created post."
      #@event_instance = EventInstance.find("1")
      @event = params[:post][:event_instances_id]
      @event_instance = EventInstance.find(@event)
      
      redirect_to @event_instance
    else
      render :action => 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      flash[:notice] = "Successfully updated car."
      redirect_to @post
    else
      render :action => 'edit'
    end
  end

  def rate
    @post = Post.find(params[:id])
    @post.rate(params[:stars], current_user, params[:dimension])
    render :update do |page|
      page.replace_html @post.wrapper_dom_id(params), ratings_for(@post, params.merge(:wrap => false))
      page.visual_effect :highlight, @post.wrapper_dom_id(params)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Successfully destroyed car."
    redirect_to posts_url
  end
end
