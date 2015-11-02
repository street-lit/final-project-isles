class Conversation < ActiveRecord::Base
  belongs_to :friend
  has_many :messages

  def title
    "#{self.friend.friend_requester.full_name} and #{self.friend.friend_accepter.full_name}'s Conversation"
  end
end
