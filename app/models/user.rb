class User < ActiveRecord::Base
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
