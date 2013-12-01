class Image < ActiveRecord::Base
  attr_accessible :desc, :enabled, :group_id, :image_name, :key_word, :location, :weight_factor, :instance
  belongs_to :image_group, foreign_key:"group_id"
  has_many :comments
  mount_uploader :instance, InstanceUploader
  paginates_per 2

  def to_json_image
    {
      "name" => read_attribute(:instance),
      "size" =>instance.size,
      "url" =>instance.url,
      "thumbnail_url" =>instance.thumb.url,
      #"delete_url" => image_path(:id => id),
      "delete_type" => "DELETE" 
    }
  end
end
