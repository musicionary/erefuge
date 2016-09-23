class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    head :no_content
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :description, :street, :city, :state, :zip_code)
  end
end
