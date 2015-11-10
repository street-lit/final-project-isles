class SessionPolicy < ApplicationPolicy
  attr_reader :current_user, :session

  def initialize(current_user, session)
    @current_user = current_user
    @session = session
  end

  def new?
    @session == false
  end
end
