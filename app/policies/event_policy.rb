class EventPolicy < ApplicationPolicy

  def show?
    true
  end

  def create?
    true
  end

  def update?
    record.user == user
  end

  def accept?
    record.bar.user == user
  end

  def decline?
    record.bar.user == user
  end

  def destroy?
    record.user == user
  end

  def my_own_events?
    true
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
