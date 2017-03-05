class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
     if params[:location].present?
	@location = params[:location]
	@distance = params[:distance]
	@events = Event.near(@location,@distance)
		hello(@events)
  else    @events = Event.all
    @hash = Gmaps4rails.build_markers(@events) do |event, marker|
    marker.lat event.latitude
    marker.lng event.longitude
    marker.infowindow event.sport
	end
   end
  end

  # GET /event/1
  # GET /events/1.json
  def show
	@event.update_attribute(:need, @event.need - 1)
  end


  def search

  end

def hello(events)

	@events = events
	@hash = Gmaps4rails.build_markers(@events) do |event, marker|
		marker.lat event.latitude
		marker.lng event.longitude
		marker.infowindow event.sport
		marker.json({title: event.name, id:event.id})
	end
end





		
  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST events/
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :address, :sport, :need)
    end
end
