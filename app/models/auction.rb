class Auction < ApplicationRecord
	validate :validate_week

  private

  def validate_week
  	  date = DateTime.parse(weekdate)
      if date.present? && date < Date.today + 6.month
          errors.add(:weekdate, 'Debes reservar con 6 meses de anticipacion')
      end
  end	
	belongs_to :residence
	has_many :bids
end
