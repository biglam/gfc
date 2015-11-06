class UserController < ApplicationController


  def index
    @users = User.all
  end

  def challenge
    @users = User.all
  end

  def show
    puts "showing"
  end
end
