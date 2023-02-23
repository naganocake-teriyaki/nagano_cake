class Item < ApplicationRecord
    has_one_attached :image, dependent: :destroy
    has_many :order_details, dependent: :destroy
    belongs_to :genre
    has_many :cart_items, dependent: :destroy

    #enum is_active: { on_sale: 0, discontinued: 1 }
      has_one_attached :image

      validates :name, presence: true
      validates :description, presence: true
      validates :price, presence: true

      def get_image
        unless image.attached?
          file_path = Rails.root.join('app/assets/images/logo2.jpeg')
          image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
        end
        image
      end

      def with_tax_price
        (price * 1.1).floor
      end

end
