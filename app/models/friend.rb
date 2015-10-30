class Friend < ActiveRecord::Base
  belongs_to :friend_requester, :class_name => 'User', :foreign_key => 'friend_requester_id'
  belongs_to :friend_accepter, :class_name => 'User', :foreign_key => 'friend_accepter_id'
end
