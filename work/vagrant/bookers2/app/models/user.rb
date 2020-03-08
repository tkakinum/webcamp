class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def email_required?
   false
 end
 def email_changed?
   false
 end
  has_many :post_images, dependent: :destroy
  has_many :books, dependent: :destroy
  belongs_to :book
  attachment :profile_image
  validates :name, length: { in: 2..20 }
  validates :introduction, length: { maximum: 50 }
end
