class EventsController < ApplicationController
  before_action :authorize_user, only: %i[edit update]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)

    if @event.save
      flash[:success] = 'You have successfully created an event.'
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      flash[:success] = 'You have successfully updated an event.'
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to user_path(current_user.id), status: :see_other
  end

  private

  def authorize_user
    @event = Event.find(params[:id])
    return if current_user.id == @event.creator_id

    flash[:error] = 'You are not authorized to edit this event.'
    redirect_to @event.creator
  end

  def event_params
    params.require(:event).permit(:location, :date)
  end
end
