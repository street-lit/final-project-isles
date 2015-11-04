class FriendPolicy < ApplicationPolicy
  attr_reader :current_user, :friend

  def initialize(current_user, friend)
    @current_user = current_user
    @friend = friend
  end

  def show?
    @friend.user_id == @current_user.id || @current_user.is_friends(@friend.user)
  end

  def edit?
    @friend.user_id == @current_user.id
  end

  def create?
    @friend.user_id == @current_user.id
  end

  def destroy?
    @friend.user_id == @current_user.id
  end
end
