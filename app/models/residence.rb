class Residence < ApplicationRecord
	#validates :name, presence: true
	#validates :des, presence: true

	has_and_belongs_to_many :auctions

	
	



end
