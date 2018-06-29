class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy, :join, :attendees]

  # GET /events
  # GET /events.json
  def index
     if params[:location].present?
	@location = params[:location]
	@distance = params[:distance]
	@events = Event.near(@location,@distance)
  else
    @events = Event.all
  end
    @hash = Gmaps4rails.build_markers(@events) do |event, marker|
    marker.lat event.latitude
    marker.lng event.longitude
    marker.infowindow "Created by #{event.name} \nNeeds: #{event.need}"
     end
  end

  # GET /event/1
  # GET /events/1.json
  def show
  end

  def join
    @token = params[:invite_token]
    if @event.attendance.users.include?(current_user)
      redirect_to events_url, alert:  "Sorry you already joined this event"
    end

    if @event.need <= 0
      redirect_to events_url, alert:  "Sorry theres already enough people for this event"
    end

    if @event.need != 0 && !@event.attendance.users.include?(current_user)
  	@event.update_attribute(:need, @event.need - 1)
    end

    if @event.privacy
      redirect_to event_password, alert: "This event needs a password to join"
    end
    @event.attendance.users << current_user
    @attendees = @event.attendance.users.all
  end

  def password
  end

  def attendees
    @attendees = @event.attendance.users.all
  end


  # GET /events/new
  def new
    if current_user.profile.displayname == nil
       redirect_to profile_path(current_user), alert: 'Please Create a Profile first.'
    end
    @event = Event.new
  end


  # GET /events/1/edit
  def edit
    if current_user.id != @event.user_id
      redirect_to events_url, alert: "Please don't try to change other peoples events."
    end
  end

  # POST events/
  # POST /events.json
  def create
    @event = Event.new(event_params.merge(name: current_user.profile.displayname, user_id: current_user.id))
    respond_to do |format|
      if @event.save
        @game = current_user.games.create(:sport => @event.sport, :name => @event.name, :description => @event.description, :sport => @event.sport)
        @event.attendance.users << current_user
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
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
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
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
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
      params.require(:event).permit(:privacy, :address, :sport, :need, :time).merge(name: current_user.profile.displayname)
    end
end
