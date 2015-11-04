class PhotoPolicy < ApplicationPolicy
  attr_reader :current_user, :photo

  def initialize(current_user, photo)
    @current_user = current_user
    @photo = photo
  end

  def show?
    @photo.user_id == @current_user.id || @current_user.is_friends(@photo.user)
  end

  def edit?
    @photo.user_id == @current_user.id
  end

  def create?
    @photo.user_id == @current_user.id
  end

  def destroy?
    @photo.user_id == @current_user.id
  end
end
