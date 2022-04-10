module EventsHelper
  def is_team_registered?(registered_teams, team)
    registered_teams.each do |registered|
      return true if registered.id == team.id
    end
    return false
  end
end
