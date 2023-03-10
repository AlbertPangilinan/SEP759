class TeamsController < ApplicationController
  before_action :set_team, only: %i[ show edit update destroy ]
  before_action :set_regions, only: %i[ new edit create ]

  # GET /teams or /teams.json
  def index
    @teams = Team.all
    @current_team_member = helpers.get_team_member_from_user(current_user)
  end

  # GET /teams/1 or /teams/1.json
  def show
    @region = Region.find_by(id: @team.region_id)
    @current_team_member = helpers.get_team_member_from_user(current_user)
  end

  # GET /teams/new
  def new
    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
  end

  # POST /teams or /teams.json
  def create
    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to team_url(@team), notice: "#{@team.name} was successfully formed!" }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1 or /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to team_url(@team), notice: "Team info successfully updated." }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1 or /teams/1.json
  def destroy
    @team.team_members.each do |team_member|
      team_member.destroy
    end

    @team.destroy

    respond_to do |format|
      format.html { redirect_to teams_url, notice: "#{@team.name} disbanded." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    def set_regions
      @regions = Region.all
    end


    # Only allow a list of trusted parameters through.
    def team_params
      params.require(:team).permit(:name, :abbrev, :region_id, :image)
    end
end
