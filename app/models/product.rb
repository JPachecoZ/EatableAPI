class Product < ApplicationRecord
  validates :name, :category, :price, :description, :picture_url, presence: true
  validates :name, uniqueness: true
end
