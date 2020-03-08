class Book < ApplicationRecord

validates :title, presence: true
validates :body, presence: true, length: { maximum: 200 }

has_many :users, dependent: :destroy
belongs_to :user
end