module ApplicationHelper
  def get_team_member_from_user(user)
    TeamMember.find_by(user_id: user.id)
  end
end
