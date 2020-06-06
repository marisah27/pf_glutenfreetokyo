class Menu < ApplicationRecord
  belongs_to :shop
  
  mount_uploader :img, ImgUploader
  
  validates :menu, length: { maximum: 100 }
  validates :price, allow_blank: true, length: { maximum: 30 } ,numericality: true
  
end
