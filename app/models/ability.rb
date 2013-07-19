class Ability
  include CanCan::Ability

  def initialize(user)
      #if user.admin
        #can :manage , :all
        #else
    user ||= User.new # guest user

    if user.admin == 1
        can :manage , :all
    elsif user.admin == 0
      can :read , :all
      can :manage , Chocolatier do |chocolatier|
        chocolatier.user_id == user.id
      end
     cannot :requests, Chocolatier
      can :new , Chocolatier
      can :new , Chocolate
      can :create ,Chocolatier
      can :crate , Chocolate
      can :manage , Chocolate do |chocolate|
        chocolate.user_id == user.id
      end
      can :rate_chocolate , Chocolate

      can :add_rating ,Rating

      can :edit_rating , Rating do |rating|
        rating.user_id == user.id
      end
    else
      can :read ,:all
      can :new , Chocolatier
      can :new , Chocolate


      end



    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end