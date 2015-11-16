class C4game < ActiveRecord::Base
  belongs_to :c4board
  belongs_to :p1, class_name: 'User'
  belongs_to :p2, class_name: 'User'
end
