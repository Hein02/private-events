class EventAttendingsController < ApplicationController
  def create
    event = Event.find(params[:event_id])
    event_attending = EventAttending.new(attended_event_id: event.id, attendee_id: current_user.id)

    if event_attending.save
      flash[:success] = 'Congrats!'
      redirect_to event
    else
      flash[:error] = 'Oops, something went wrong!'
      redirect_to root_path
    end
  end
end
