class Api::TeamsController < ApiController
  def index
    render(json: Team.all)
  end

  def show
    team = Team.find_by(id: params[:id])
    if (team)
      render(json: team, include: :team_members)
    else
      render(json: { error: 'Team not found' }, status: 404)
    end
  end

  def search
    render(json: Team.where('name LIKE ?', "%#{params[:name]}%"), include: :team_members)
  end

  def create
    team = Team.new(name: params[:name], abbrev: params[:abbrev], region_id: params[:region_id])
    if (team.save)
      render(json: team, include: :team_members)
    else
      render(json: { error: 'Cannot create team' }, status: 404)
    end
  end

  def destroy
    team = Team.find_by(id: params[:id])

    team.team_members.each do |team_member|
      team_member.destroy
    end

    if (team.destroy)
      render(json: team, include: :team_members)
    else
      render(json: { error: 'Cannot disband team' }, status: 404)
    end
  end

end
