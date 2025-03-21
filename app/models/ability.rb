# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest (not logged in)

    if user.role == "admin"
      can :manage, :all # Admins can do everything
    else
      can :read, Document # Normal user are able to read documents
      can :manage, Document, user_id: user.id # User are able to manage their own documents
    end
  end
end
