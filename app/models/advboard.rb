class Advboard < ActiveRecord::Base
  has_many :advgames, class_name: "Advgame", foreign_key: :id

end
