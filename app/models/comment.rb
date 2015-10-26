class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :blog
  belongs_to :user
end
