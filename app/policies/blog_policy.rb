class BlogPolicy < ApplicationPolicy
  attr_reader :current_user, :blog

  def initialize(current_user, blog)
    @current_user = current_user
    @blog = blog
  end

  def show?
    @blog.user_id == @current_user.id || @current_user.is_friends(@blog.user)
  end

  def edit?
    @blog.user_id == @current_user.id
  end

  def create?
    @blog.user_id == @current_user.id
  end

  def destroy?
    @blog.user_id == @current_user.id
  end
end
