class AtttBoard < ActiveRecord::Base
  has_many :AtttGames, class_name: "AtttGame", foreign_key: :atttboard0
end