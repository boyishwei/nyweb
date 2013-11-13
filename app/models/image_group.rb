class ImageGroup < ActiveRecord::Base
  attr_accessible :category_id, :cover_image_id, :desc, :enabled, :group_name, :key_word, :weight_factor
  has_many :images, foreign_key: "group_id"
  belongs_to :cover, class_name: "Image", foreign_key: "cover_image_id"
  belongs_to :category
  paginates_per 3
end
