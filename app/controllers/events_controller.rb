class EventsController < ApplicationController
  before_action :set_user, only: %i[new create]
  before_action :set_bar, only: %i[new create]

  def index
    @events = policy_scope(Event)
  end

  def new
    @event = Event.new
    authorize @event
  end

  def create
    @event = Event.new(event_params)
    @event.user = @user
    @event.bar = @bar
    authorize @event
    if @event.save
      redirect_to bar_path(@bar)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
    @bar = @event.bar
    authorize @event
  end

  def update
    @event = Event.find(params[:id])
    authorize @event
    if @event.update(event_params)
      redirect_to bar_path(@event.bar)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    authorize @event
    @event.destroy
    redirect_to bar_path(@event.bar), status: :see_other
  end

  private

  def event_params
    params.require(:event).permit(:photo, :bar_comment, :artist_comment, :date, :status, :name)
  end

  def set_user
    @user = current_user
  end

  def set_bar
    @bar = Bar.find(params[:bar_id])
  end

end
