class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def new
    @match = Match.new
  end

  def show
    @match = Match.find(params[:id])
  end

  def edit
    @match = Match.find(params[:id])
  end
  def create
    @match = Match.new(match_params)
    @match.users << User.find(@match.p1_id)
    @match.users << User.find(@match.p2_id)
    respond_to do |format|
      if @match.save
        format.html { redirect_to @match, notice: 'Match was successfully created.' }      
      else
        format.html { render :new }
      end
    end
  end

  def update
    @match = Match.find(params[:id])
    winner = User.find(params[:match][:winner_id])
    winner.points += 3
    winner.save
    respond_to do |format|
      if @match.update(match_params)
        format.html { redirect_to @match, notice: 'Match was successfully saved.' }      
      else
        format.html { render :edit }
      end
    end
  end

  private
  def match_params
    params.require(:match).permit(:p1_id, :p2_id, :winner_id)
  end
end
