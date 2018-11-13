class Auction < ApplicationRecord
	validates :name, presence: true
	validates :des, presence: true
	validates :monto, presence: true
	validates :minimapuja, presence: true

	has_many: residences
end
