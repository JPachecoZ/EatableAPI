class OrderDetail < ApplicationRecord
  belongs_to :product
  belongs_to :order

  validates :quantity, numericality: { greater_than: 0 }

  def subtotal
    product.price * quantity
  end
end
