class Service < ApplicationRecord
	belongs_to :category
	belongs_to :user

	has_many :line_items 
	has_many :orders, through: :line_items
end
