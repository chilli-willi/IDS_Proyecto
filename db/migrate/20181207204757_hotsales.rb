class Hotsales < ActiveRecord::Migration[5.2]
  def change
  	  create_table :hotsales do |t|
     
      t.integer :price
     

      t.timestamps
   	     
   	
   
end
  end
end