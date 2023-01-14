class EventAttendingsController < ApplicationController
  before_action :require_login, only: %i[create]

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

  private

  def require_login
    return if user_signed_in?

    flash[:error] = 'You must be logged in to attend an event.'
    redirect_to new_user_session_path
  end
end
