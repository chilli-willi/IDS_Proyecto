class Auction < ApplicationRecord
		
	belongs_to :residence
	has_many :bids
end
