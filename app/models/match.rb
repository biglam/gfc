class Match < ActiveRecord::Base

  has_and_belongs_to_many :users
  validate :check_user_count, :on => :create

  private
  def check_user_count
  #add validation
   end

end
