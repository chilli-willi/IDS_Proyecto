class Residence < ApplicationRecord
	validates :name, presence: true
	validates :des, presence: true

	belongs_to :auction
	



end
