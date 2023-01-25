class OrderDetailSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :subtotal, :product_id, :product_name

  def product_name
    object.product.name
  end

  def product_id
    object.product.id
  end
end
