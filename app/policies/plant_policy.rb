class PlantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
      # scope.where(user: user) # if you want to show only restaurants that the current user created himself
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    user == record.user || user.admin == true
    # user => current_user, record => @plant (argument passed to 'authorize')
  end

  def destroy?
    user == record.user || user.admin == true
  end

  def my_plants?
    true
  end
end
