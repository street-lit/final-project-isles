class Message < ActiveRecord::Base
  belongs_to :friend
  belongs_to :conversation
  belongs_to :user
end
