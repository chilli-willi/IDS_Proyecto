class Residence < ApplicationRecord
	#validates :name, presence: true
	#validates :des, presence: true
	has_many :reservations , :dependent => :delete_all
	has_many :auctions, :dependent => :delete_all
	has_many :hotsales, :dependent => :delete_all

end
