class Series < ApplicationRecord

  validates :name, :image, presence:true
end
