class MatchesController < ApplicationController
  def new
    @match = Match.new
  end

  def create
    @match = Match.new(match_params)

    if @match.save
      flash[:notice] = "Match has been successfully added"
      redirect_to root_url
    else
      flash[:now] = "Match has not been added"
      render 'new'
    end
  end

  private

    def match_params
      params.require(:match).permit(:match_date, :home_player_id,
                            :away_player_id, :home_score, :away_score)
    end
end