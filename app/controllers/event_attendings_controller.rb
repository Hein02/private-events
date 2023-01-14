class EventAttendingsController < ApplicationController
  before_action :require_login, :user_on_list, :user_owns_event, only: %i[create]

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

  def user_on_list
    event = Event.find(params[:event_id])
    return unless event.attendees.exists?(current_user.id)

    flash[:error] = 'You are already on the list.'
    redirect_to event
  end

  def user_owns_event
    event = Event.find(params[:event_id])
    return if event.creator_id != current_user.id

    flash[:error] = 'You created this event.'
    redirect_to event
  end
end
