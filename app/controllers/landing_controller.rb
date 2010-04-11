class LandingController < ApplicationController
  def index
    @businesses = Business.all
   @search = EventInstance.search(params[:search])
    @event_instances = @search.all
   
           render :file => 'app/views/landing/index.html.erb'
  end
   

end