class Post < ActiveRecord::Base
  validates_presence_of :body, :title

  belongs_to :blog
  belongs_to :user
  has_many :comments, dependent: :destroy
end
