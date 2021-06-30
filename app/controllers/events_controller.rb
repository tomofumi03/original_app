class EventsController < ApplicationController


  def index
    @today = Date.today
    from_date = Date.new(@today.year, @today.month, @today.beginning_of_month.day).beginning_of_week(:sunday)
    to_date = Date.new(@today.year, @today.month, @today.end_of_month.day).end_of_week(:sunday)
    @calendar_data = from_date.upto(to_date)
  end

  def new
    @event = Event.new
    @user = current_user
  end

  def create
    @event = Event.create(event_params)
    if @event.save
      flash[:success] = "イベントが追加されました"
      redirect_to event_path(@event.user_id)
    else
      flash[:danger] = "イベントを追加できませんでした"
    end
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
