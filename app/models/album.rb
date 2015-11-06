class Album < ActiveRecord::Base
  validates_presence_of :title

  belongs_to :user
  has_many :photos, dependent: :destroy
  has_many :observations, dependent: :destroy
end
