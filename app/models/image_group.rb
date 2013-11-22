class ImageGroup < ActiveRecord::Base
  attr_accessible :category_id, :cover_image_id, :desc, :enabled, :group_name, :key_word, :weight_factor, :promoted
  has_many :images, foreign_key: "group_id"
  belongs_to :cover, class_name: "Image", foreign_key: "cover_image_id"
  belongs_to :category
  paginates_per 3

  validates :group_name, presence: {message: "组名不能为空"}
  validates :weight_factor, presence: {message: "权重不能为空"}
end
