class PostPolicy < ApplicationPolicy
  attr_reader :current_user, :post

  def initialize(current_user, post)
    @current_user = current_user
    @post = post
  end

  def show?
    @post.user_id == @current_user.id || @current_user.is_friends(@post.user)
  end

  def edit?
    @post.user_id == @current_user.id
  end

  def create?
    @post.user_id == @current_user.id
  end

  def destroy?
    @post.user_id == @current_user.id
  end
end
