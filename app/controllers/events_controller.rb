class EventsController < ApplicationController
  def index
    @ransack_search = Event.ransack(params[:query])
    @events = @ransack_search.result(distinct: true)
  end
end
