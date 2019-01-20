class Cart < ApplicationRecord
  has_many :cart_items
  scope :current, -> { where(paid: false) }
  scope :paid, -> { where(paid: true) }

  def total
    cart_items.map {|c| c.product.price}.sum
  end

  def total_cents
    (cart_items.map {|c| c.product.price}.sum * 100)
  end
end
