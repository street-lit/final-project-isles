class Blog < ActiveRecord::Base
  validates_presence_of :title, :description

  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
end
