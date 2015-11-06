class Photo < ActiveRecord::Base
  belongs_to :album
  belongs_to :user
  has_many :observations, dependent: :destroy
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }, default_url: "/images/:style/missing.png", :storage => :s3, :bucket => "isles", :url =>':s3_domain_url',
  :path => ':class/:attachment/:id_partition/:style/:filename'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
