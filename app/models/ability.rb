class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read , [Publication,PublicationAttribute,PublicationType,PublicationSubtype,Author] 

    if user.admin?
        can [:read,:index,:destroy,:edit] , [User]
        can [:destroy , :edit , :create ] , [Publication]
        can [:create , :edit , :destroy ] , [PublicationAttribute]
        can [:create , :edit , :destroy ] , [PublicationType]
        can [:create , :edit , :destroy ] , [PublicationSubtype]
        
        can [:create , :edit ] , [Author]
        can :destroy , Author do |author|
            author.user == nil
        end
    elsif user.approved
        can [:create,:edit,:destroy] , [Publication] , :user_id => user.id
        
        can [:create,:edit ] , [Author] do |author|
            author.owner && author.owner_id == user.id
        end
        can :destroy , Author do |author|
            author.owner && author.owner_id == user.id && (author.user==nil || author.user_id != user.id)
        end
    end

    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
