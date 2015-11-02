class Message < ActiveRecord::Base
  belongs_to :friend
  belongs_to :conversation
end
