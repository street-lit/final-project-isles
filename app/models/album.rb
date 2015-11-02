class Album < ActiveRecord::Base
  validates_presence_of :title

  belongs_to :user
  has_many :photos, dependent: :destroy
end
