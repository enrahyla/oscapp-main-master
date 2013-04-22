class EventsController < ApplicationController

	before_filter :require_login, only: [:create, :destroy, :edit, :update]

	def index
		@events = Event.all.reverse
		#format.html
  @search = Event.search do
    fulltext params[:search]
  end
  @events = @search.results
end

	def announcements
		@events = Event.all
	end

	def show
		@event = Event.find(params[:id])
	end

	def new
	@event = Event.new 
	# respond_to do |format|
	# 		format.html { redirect_to event_path(@event)}
	# 		format.js
	# end
end

	def create
		@event = Event.new(params[:event])
		@event.save
		respond_to do |format|
			format.html { redirect_to event_path(@event)}
			format.js
		
	end
end

	def destroy	
		@event = Event.find(params[:id])
		@event.destroy
		flash.notice = "Event '#{@event.title}' Destroyed"
		respond_to do |format|
			format.html { redirect_to events_path(@events) }
			format.js
		end		
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		@event.update_attributes(params[:event])
		flash.notice = "Event '#{@event.title}' Updated!"
		   respond_to do |format|
      format.html { redirect_to event_path(@event) }
      format.js
		end
	end
end #end
