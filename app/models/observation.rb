class Observation < ActiveRecord::Base
  validates_presence_of :body

  belongs_to :photo
  belongs_to :album
  belongs_to :user
end
