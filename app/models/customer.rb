class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :addresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :items, through: :cart_items

  has_one_attached :image
  has_many :cart_items
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   with_options presence: true do
   validates :last_name
   validates :first_name
   validates :kana_last_name
   validates :kana_first_name
   validates :email
   validates :postal_code
   validates :address
   validates :phone_number
   end
   
  def total_amount
    total = 0
    cart_items.each do |cart_item|
      total = total + cart_item.amount
    end
    return total
  end
end
