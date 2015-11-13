class Event < ActiveRecord::Base
  validates_presence_of :dateof, :occasion, :description
  belongs_to :friend
end
