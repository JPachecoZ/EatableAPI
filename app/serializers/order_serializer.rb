class OrderSerializer < ActiveModel::Serializer
  attributes :id, :items_count, :total, :delivery_address, :created_at
  has_many :order_details
end
