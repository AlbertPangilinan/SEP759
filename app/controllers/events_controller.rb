class EventsController < ApplicationController
  # GET /events or /events.json
  def index
    @events = Event.all
  end

  # GET /events/1 or /events/1.json
  def show
    @event = Event.find(params[:id])
    @current_team_member = helpers.get_team_member_from_user(current_user)
    @current_team = @current_team_member ? Team.find_by(id: @current_team_member.team_id) : nil
    @registered_teams = @event.teams
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name, :venue, :city, :country)
    end
end
