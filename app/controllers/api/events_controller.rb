class Api::EventsController < ApiController
  def index
    render(json: Event.all)
  end

  def show
    event = Event.find_by(id: params[:id])
    if (event)
      render(json: event)
    else
      render(json: { error: 'Event not found' }, status: 404)
    end
  end

  def search
    render(json: Event.where('name LIKE ?', "%#{params[:name]}%"))
  end
end
