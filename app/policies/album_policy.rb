class AlbumPolicy < ApplicationPolicy
  attr_reader :current_user, :album

  def initialize(current_user, album)
    @current_user = current_user
    @album = album
  end

  def show?
    @album.user_id == @current_user.id || @current_user.is_friends(@album.user)
  end

  def edit?
    @album.user_id == @current_user.id
  end

  def create?
    @album.user_id == @current_user.id
  end

  def destroy?
    @album.user_id == @current_user.id
  end
end
