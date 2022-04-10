module TeamsHelper
  def is_part_of_team?(team_member, team)
    return team_member && (team_member.team_id == team.id)
  end
end
