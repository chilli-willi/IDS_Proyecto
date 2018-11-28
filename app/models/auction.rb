class Auction < ApplicationRecord
	validates :name, presence: true
	validates :des, presence: true
	validates :monto, presence: true
	validates :minimapuja, presence: true

	
	#belongs_to:residence

	has_and_belongs_to_many :users
end
