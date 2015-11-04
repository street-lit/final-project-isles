class Friend < ActiveRecord::Base
  has_one :conversation, dependent: :destroy
  belongs_to :friend_requester, :class_name => 'User', :foreign_key => 'friend_requester_id'
  belongs_to :friend_accepter, :class_name => 'User', :foreign_key => 'friend_accepter_id'
  has_many :events, dependent: :destroy

  def each_friend
    "#{friend_requester.full_name} and #{friend_accepter.full_name}"
  end

  def friend_not_user(current_user)
    friend1 = self.friend_requester
    friend2 = self.friend_accepter
    if friend1 != current_user
      friend1.full_name
    else
      friend2.full_name
    end
  end

  def friend_is_user(current_user)
    friend1 = self.friend_requester
    friend2 = self.friend_accepter
    if friend1 == current_user
      friend1.full_name
    else
      friend2.full_name
    end
  end

  def other_user(current_user)
    friend1 = self.friend_requester
    friend2 = self.friend_accepter
    if friend1 == current_user
      friend2
    else
      friend1
    end
  end
end
