class Item < ApplicationRecord
    has_one_attached :image, dependent: :destroy
    has_many :order_details, dependent: :destroy
    belongs_to :genre
    
    enum is_active: { on_sale: 0, discontinued: 1 }
      has_one_attached :image
    
      validates :name, presence: true
      validates :introduction, presence: true
      validates :price, presence: true
    
      def get_image
        (image.attached?) ? image : 'logo2.jpg'
      end
    
      def with_tax_price
        (price * 1.1).floor
      end

end
