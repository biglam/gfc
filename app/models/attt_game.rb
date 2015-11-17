class AtttGame < ActiveRecord::Base
  belongs_to :p1, class_name: 'User'
  belongs_to :p2, class_name: 'User'
  # has_many :AtttBoards
  belongs_to :atttboard0, class_name: 'AtttBoard'
  belongs_to :atttboard1, class_name: 'AtttBoard'
  belongs_to :atttboard2, class_name: 'AtttBoard'
  belongs_to :atttboard3, class_name: 'AtttBoard'
  belongs_to :atttboard4, class_name: 'AtttBoard'
  belongs_to :atttboard5, class_name: 'AtttBoard'
  belongs_to :atttboard6, class_name: 'AtttBoard'
  belongs_to :atttboard7, class_name: 'AtttBoard'
  belongs_to :atttboard8, class_name: 'AtttBoard'

end
