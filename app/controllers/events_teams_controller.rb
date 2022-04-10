class EventsTeamsController < ApplicationController
  before_action :set_event_team

  def create
    @event.teams << @team
    redirect_to(event_path(@event.id), notice: "Successfully registered!")
  end

  def destroy
    @event.teams.delete(@team)
    redirect_to(event_path(@event.id), notice: "Successfully cancelled registration.")
  end
  
  private
  def set_event_team
    @event = Event.find(params[:event_id])
    @team = Team.find(params[:team_id])
  end

  def events_teams_params
    params.require(:events_teams).permit(:team_id, :event_id)
  end
end
