class AddDates2ToAuctions < ActiveRecord::Migration[5.2]
  def change
    add_column :auctions, :dateStart, :date
    add_column :auctions, :dateEnd, :date
  end
end
