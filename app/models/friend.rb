class Friend < ActiveRecord::Base
  has_one :conversation
  belongs_to :friend_requester, :class_name => 'User', :foreign_key => 'friend_requester_id'
  belongs_to :friend_accepter, :class_name => 'User', :foreign_key => 'friend_accepter_id'
  has_many :events

  def each_friend
    friend1 = User.find(self.friend_requester_id)
    friend2 = User.find(self.friend_accepter_id)
    "#{friend1.full_name} and #{friend2.full_name}"
  end

  def friend_not_user(current_user)
    friend1 = self.friend_requester
    friend2 = self.friend_accepter
    if friend1 != current_user
      friend1.full_name
    else
      "#{friend2.full_name}"
    end
  end
end
