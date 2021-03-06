class Admin::EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit, :destroy]
  before_action :require_is_admin
  layout "admin"

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.order("created_at DESC")
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user

    if @event.save
      redirect_to admin_events_path
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to admin_events_path
    else
      render :new
    end
  end

  def destroy
    @event = Event.find(params[:id])

    @event.destroy

    redirect_to admin_events_path
  end

  def publish
    @event = Event.find(params[:id])
    @event.publish!
    redirect_to :back
  end

  def hide
    @event = Event.find(params[:id])
    @event.hide!
    redirect_to :back
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :endtime, :important_class, :executive_method, :is_hidden)
  end
end
