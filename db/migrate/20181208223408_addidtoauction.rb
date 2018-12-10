class Addidtoauction < ActiveRecord::Migration[5.2]
  def change
  	add_column :auctions, :residence_id, :integer  
  end
end
