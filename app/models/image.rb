class Image < ActiveRecord::Base
  attr_accessible :desc, :enabled, :group_id, :image_name, :key_word, :location, :weight_factor, :instance
  belongs_to :image_group, foreign_key:"group_id"
  has_many :comments
  mount_uploader :instance, InstanceUploader
  paginates_per 2
end
