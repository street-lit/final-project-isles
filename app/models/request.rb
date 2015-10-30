class Request < ActiveRecord::Base
  belongs_to :user
  belongs_to :requested_friend, class_name: "User"
end
