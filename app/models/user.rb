class User < ActiveRecord::Base
  has_secure_password
  has_many :blogs
  has_many :posts
  has_many :comments

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
