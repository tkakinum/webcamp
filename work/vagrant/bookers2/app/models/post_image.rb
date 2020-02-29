class PostImage < ApplicationRecord

	belongs_to :user
	attachment :image
	validates :name, length: { in: 2..20 }
	validates :name, presence: true
	validates :introduction, presence: true
end
