class Conversation < ActiveRecord::Base
  has_many :messages
  belongs_to :friend_one, :class_name => 'Friend', :foreign_key => 'friend_id_one'
  belongs_to :friend_two, :class_name => 'Friend', :foreign_key => 'friend_id_two'
end
