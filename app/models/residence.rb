class Residence < ApplicationRecord
	#validates :name, presence: true
	#validates :des, presence: true
	has_many :reservations
end
