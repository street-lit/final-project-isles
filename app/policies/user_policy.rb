class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def show?
    @user.id == @current_user.id || @current_user.is_friends(@user)
  end

  def edit?
    @user.id == @current_user.id
  end

  def destroy?
    @user.id == @current_user.id
  end
end
