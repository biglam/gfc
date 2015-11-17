class AtttgamesController < ApplicationController

  def index

  end

  def new
    @game = AtttGame.new
  end

end
