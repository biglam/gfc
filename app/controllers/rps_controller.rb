class RpsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @rps = Rp.all.order(updated_at: :desc)
  end

  def new
    @game = Rp.new
  end

  def create
    gid = Rp.create(rp_params).id
    add_users(gid)
    redirect_to(edit_rp_path(gid))
  end

  def edit
    @rp = Rp.find(params[:id])
  end

  def update
    @rp = Rp.find(params[:id])
    # binding.pry;''
    winner = @rp.determine_winner(params[:rp][:p1_move], params[:rp][:p2_move])
    set_winner_id(winner)
    @rp.update(rp_params)
    if @rp.winner_id == nil
      User.find(@rp.p1_id).add_draw_to_player
      User.find(@rp.p2_id).add_draw_to_player
    else
      User.find(@rp.winner_id).add_win_to_player 
    end 
    @rp.save
    redirect_to(@rp)
  end

  def show
    @rp = Rp.find(params[:id])
  end

private
  def rp_params
    params.require(:rp).permit(:winner_id, :p1_id, :p2_id, :p1_move, :p2_move)
    end

    def add_users(id)
      newgame = Rp.find(id)
      newgame.users << User.find(newgame.p1_id)
      newgame.users << User.find(newgame.p2_id)
    end 

    def set_winner_id(winner)
      if winner == 1
        @rp.winner_id = @rp.p1_id
      elsif winner == 2
        @rp.winner_id = @rp.p1_id
      end
    end
end
