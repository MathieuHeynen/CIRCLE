class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :name, :brand, :description, :size, :price, :photo, presence: true
end
