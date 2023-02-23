class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  validates :amount, format: { with: /^[0-9]+$/, multiline: true }, presence: true

   def total_amount
    total = 0
    puts 'test1'
    self.each do |cart_item|
      puts 'test2'
      total = total + cart_item.amount
    end
    puts 'test3'
    return total
   end
end
