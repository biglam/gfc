class Advgame < ActiveRecord::Base
  belongs_to :p1, class_name: 'User'
  belongs_to :p2, class_name: 'User'
  # has_many :AtttBoards
  belongs_to :atttmainboard, class_name: 'Advboard'
  belongs_to :advboard0, class_name: 'Advboard'
  belongs_to :advboard1, class_name: 'Advboard'
  belongs_to :advboard2, class_name: 'Advboard'
  belongs_to :advboard3, class_name: 'Advboard'
  belongs_to :advboard4, class_name: 'Advboard'
  belongs_to :advboard5, class_name: 'Advboard'
  belongs_to :advboard6, class_name: 'Advboard'
  belongs_to :advboard7, class_name: 'Advboard'
  belongs_to :advboard8, class_name: 'Advboard'

end