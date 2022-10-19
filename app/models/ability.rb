class Ability
  include CanCan::Ability
  def initialize(user)
    if user.nil?
      can :read, :all
    elsif user
      can %i[read create], :all
      can %i[destroy], Recipe, user_id: user.id
      can %i[destroy], Inventory, user_id: user.id
    end
  end
end
