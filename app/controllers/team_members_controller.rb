class TeamMembersController < ApplicationController
  before_action :set_team, only: %i[ create destroy ]

  def create
    @team_member = @team.team_members.new(team_member_params)
    if (@team_member.save)
      TeamMemberMailer.with(user: current_user, team: @team).join_team_email.deliver_now
      redirect_to(@team, notice: "Successfully joined #{@team.name}!")
    else
      puts("Failed")
      redirect_to(@team, alert: "Unable to join #{@team.name}.")
    end
  end

  def destroy
    @team_member = @team.team_members.find(params[:user_id])
    @team_member.destroy
    redirect_to(@team, notice: "Successfully left #{@team.name}.")
  end
  
  private
  def set_team
    @team = Team.find(params[:team_id])
  end

  def team_member_params
    params.require(:team_member).permit(:ign, :country, :role, :control_scheme, :user_id)
  end
end
