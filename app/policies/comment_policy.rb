class CommentPolicy < ApplicationPolicy
  attr_reader :current_user, :comment

  def initialize(current_user, comment)
    @current_user = current_user
    @comment = comment
  end

  def show?
    @comment.user_id == @current_user.id || @current_user.is_friends(@comment.user)
  end

  def edit?
    @comment.user_id == @current_user.id
  end

  def create?
    @comment.user_id == @current_user.id
  end

  def destroy?
    @comment.user_id == @current_user.id
  end
end
