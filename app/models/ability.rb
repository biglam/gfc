class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.role? :admin
      can :manage, :all
  else
    can [:create, :read], :all
    can :update, Game do |game|
        game.p1_id == user.id || game.p2_id == user.id
    end
        can [:edit, :update], Rp do |game|
        game.p1_id == user.id || game.p2_id == user.id
    end
        can [:edit, :update], C4game do |game|
        game.p1.id == user.id || game.p2.id == user.id
    end
        can [:edit, :update], Advgame do |game|
        game.p1.id == user.id || game.p2.id == user.id
    end
end
end

end
