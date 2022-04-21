class TeamMemberMailer < ApplicationMailer
  default from: 'sep759apangilinan@gmail.com'

  def join_team_email
    @user = params[:user]
    @team = params[:team]
    @url = 'https://sep759-finalproject-phase2.herokuapp.com/'
    mail(to: @user.email, subject: 'You have joined a team!')
  end
end
