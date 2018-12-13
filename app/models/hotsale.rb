class Hotsale < ApplicationRecord


validate :validate_week

  private

  def validate_week
  	  date = DateTime.parse(weekdate)
      if date.present? && date < Date.today 
          errors.add(:weekdate, 'No puedes reservar fechas antiguas')
      end
  end

  belongs_to :residence
end
