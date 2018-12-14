class Addweek < ActiveRecord::Migration[5.2]
  def change
  	add_column :hotsales, :weekdate, :text  
 	add_column :hotsales, :residence_id, :integer 
  end
end
