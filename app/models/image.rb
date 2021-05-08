class Image < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 300 }

end
