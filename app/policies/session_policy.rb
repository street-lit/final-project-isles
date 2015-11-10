class SessionPolicy < ApplicationPolicy
  attr_reader :current_user, :session

  def initialize(current_user, session)
    @current_user = current_user
    @session = session
  end

  # def new?
  #   @session.user_id == @current_user.id || @session == nil
  # end
end
