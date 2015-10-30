class User < ActiveRecord::Base
  has_many :requests
  has_many :requested_friends, through: :requests
  has_many :reverse_requests, class_name: "Request", foreign_key: "requested_friend_id"
  has_many :reverse_requested_friends, through: :reverse_requests, source: :user

  has_secure_password
  has_many :blogs
  has_many :posts
  has_many :comments
  has_many :albums
  has_many :photos
  has_many :observations

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
