class Residence < ApplicationRecord
	#validates :name, presence: true
	#validates :des, presence: true
	has_many :reservations

	has_many :auctions
	has_many :hotsales

end
