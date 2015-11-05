class EventPolicy < ApplicationPolicy
  attr_reader :current_user, :event

  def initialize(current_user, event)
    @current_user = current_user
    @event = event
  end

  def show?
    @event.user_id == @current_user.id || @current_user.is_friends(@event.user)
  end

  def edit?
    @event.user_id == @current_user.id
  end

  def create?
    @event.user_id == @current_user.id
  end

  def destroy?
    @event.user_id == @current_user.id
  end
end
