class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :first_name, :last_name, :username
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }, default_url: "/images/:style/missing.png", :storage => :s3, :bucket => "isles", :url =>':s3_domain_url',
  :path => ':class/:attachment/:id_partition/:style/:filename'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_many :albums, dependent: :destroy
  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :friend_requested_friends, :class_name => 'Friend', :foreign_key => 'friend_requester_id', dependent: :destroy
  has_many :friend_accepted_friends, :class_name => 'Friend', :foreign_key => 'friend_accepter_id', dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :observations, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :requested_friends, through: :requests, dependent: :destroy
  has_many :reverse_requests, class_name: "Request", foreign_key: "requested_friend_id", dependent: :destroy
  has_many :reverse_requested_friends, through: :reverse_requests, source: :user, dependent: :destroy

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  #Request Methods

  def has_pending_friend_requests
    self.requests.any? do |request|
      [request.user_id].include?(self.id) && request.did_confirm == false
    end
  end

  def has_friend_requests
    self.reverse_requests.any? do |reverse_request|
      [reverse_request.requested_friend_id].include?(self.id) && reverse_request.did_confirm == false
    end
  end

  def friends
    self.friend_requested_friends + self.friend_accepted_friends
  end

  def is_friends(user)
    self.friends.any? do |friend|
      [friend.friend_requester_id, friend.friend_accepter_id].include?(user.id)
    end
  end

  def users_friends
    self.friends.map do |friend|
      friend.other_user(self)
    end
  end

  def users_friends_blogs
    self.users_friends.flat_map do |friend|
      friend.blogs
    end
  end

  def users_friends_albums
    self.users_friends.flat_map do |friend|
      friend.albums
    end
  end
end
