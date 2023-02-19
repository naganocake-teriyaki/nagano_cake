class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :image
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
end
