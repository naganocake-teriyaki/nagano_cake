class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: {入金待ち:0,入金確認:1,製作中:2,発送準備中:3,発送済み:4}
  validates :address, presence:true

  def items_amount
    total = 0
    puts 'test1'
    order_details.each do |detail|
      puts 'test2'
      total = total + detail.amount
    end
    puts 'test3'
    return total
  end



   after_update do
      if self.status == "入金確認"
        self.order_details.each {|order_detail|
        order_detail.update(making_status: "製作待ち")
        }
      end
    end
end