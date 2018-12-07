class Adddate < ActiveRecord::Migration[5.2]
  def change
  	add_column :reservations, :startdate, :date
  	add_column :reservations, :enddate, :date
  	add_column :reservations, :modo, :integer
  end
end
