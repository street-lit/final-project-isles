class ObservationPolicy < ApplicationPolicy
  attr_reader :current_user, :observation

  def initialize(current_user, observation)
    @current_user = current_user
    @observation = observation
  end

  def show?
    @observation.user_id == @current_user.id || @current_user.is_friends(@observation.user)
  end

  def edit?
    @observation.user_id == @current_user.id
  end

  def create?
    @observation.user_id == @current_user.id
  end

  def destroy?
    @observation.user_id == @current_user.id
  end
end
