class Addweek < ActiveRecord::Migration[5.2]
  def change
  	 add_reference :hotsales, :residence, foreign_key: true 
  	add_column :hotsales, :weekdate, :text  
  end
end
