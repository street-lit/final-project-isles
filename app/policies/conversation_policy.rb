class ConversationPolicy < ApplicationPolicy
  attr_reader :current_user, :conversation

  def initialize(current_user, conversation)
    @current_user = current_user
    @conversation = conversation
  end

  def show?
    @conversation.friend.friend_is_user(@user) == @current_user.full_name || @conversation.friend.friend_not_user(@user) == @current_user.full_name
  end

  def create?
    @conversation.friend.friend_is_user(@user) == @current_user.full_name || @conversation.friend.friend_not_user(@user) == @current_user.full_name
  end

  def destroy?
    @conversation.friend.friend_is_user(@user) == @current_user.full_name || @conversation.friend.friend_not_user(@user) == @current_user.full_name
  end
end
