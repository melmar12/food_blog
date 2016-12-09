class Photo < ActiveRecord::Base
  belongs_to :post

  has_attached_file :image, styles: { medium: "500x700>"}, default_url: "/images/:style/missing.png"
  
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
