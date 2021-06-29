class EventsController < ApplicationController


  def index
    @events = Event.all
  end

  def new
    @event = Event.new
    @user = current_user
  end

  def create
    @event = Event.create(event_params)
  end

  def show
    #binding.pry
    @events = Event.where(user_id: current_user.id)
  end

  private

  def event_params
    params.require(:event).permit(:title, :content, :start_time, :user_id)
  end


end
