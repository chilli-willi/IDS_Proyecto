class Weekauction < ActiveRecord::Migration[5.2]
  def change
  	add_column :auctions, :weekdate, :text
  end
end
