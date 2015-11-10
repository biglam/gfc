class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :games

  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end

  def add_win_to_player
    self.points += 3
    self.wins += 1
    self.save
  end

  def add_draw_to_player
    self.points += 1
    self.draws += 1
    self.save
  end

end
