class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :category, :description, :picture_url
end
