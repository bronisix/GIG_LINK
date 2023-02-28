class EventPolicy < ApplicationPolicy

  def show?
    true
  end

  def create?
    true
  end

  def update?
    true
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

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
