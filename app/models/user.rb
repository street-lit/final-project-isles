class User < ActiveRecord::Base
  has_many :friendships
  has_many :friends, :through => :friendships, :source => :user
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

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

  # def mutual_friends
  #     inverse_friendships.where('user_id in (?)', friend_ids)
  #   end

  #   def mutual_friend_profiles
  #     User.where('id in (?)', mutual_friends.pluck(:user_id))
  #   end

  #   def requesting_friends
  #     inverse_friendships.where('user_id not in (?)', friend_ids)
  #   end

  #   def requesting_friend_profiles
  #     User.where('id in (?)', requesting_friends.pluck(:user_id))
  #   end

  #   def pending_friends
  #     friendships.where('friendship_id not in (?)', inverse_friend_ids)
  #   end

  #   def pending_friend_profiles
  #     User.where('id in (?)', pending_friends.pluck(:friendship_id))
  #   end
end
