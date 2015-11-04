class MessagePolicy < ApplicationPolicy
  attr_reader :current_user, :message

  def initialize(current_user, message)
    @current_user = current_user
    @message = message
  end

  def show?
    @message.user_id == @current_user.id || @current_user.is_friends(@message.user)
  end

  def create?
    @message.user_id == @current_user.id
  end

  def destroy?
    @message.user_id == @current_user.id
  end
end
