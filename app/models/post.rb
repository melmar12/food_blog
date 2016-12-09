class Post < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image, styles: { medium: "350x197>", thumb: "100x100>", large: "1500x2100>" }, default_url: "/images/:style/missing.png"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
