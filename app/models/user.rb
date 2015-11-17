class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :games
  has_and_belongs_to_many :rp

  has_many :c4games_as_p1, class_name: "C4game", foreign_key: :p1_id
  has_many :c4games_as_p2, class_name: "C4game", foreign_key: :p2_id
  has_many :AtttGames_as_p1, class_name: "AtttGame", foreign_key: :p1_id
  has_many :AtttGames_as_p2, class_name: "AtttGame", foreign_key: :p2_id


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
