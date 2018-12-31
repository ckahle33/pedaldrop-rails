class Product < ApplicationRecord
    # composed_of :price,
    #   :class_name => 'Money',
    #   :mapping => %w(price cents),
    #   :converter => Proc.new { |value| Money.new(value) }
end
