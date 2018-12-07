class Hotsales < ActiveRecord::Migration[5.2]
  def change

   	 add_column :hotsales, :price, :integer      
   	 add_reference :hotsales, :residence, foreign_key: true 
   

  end
end