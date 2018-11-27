class Auctionscampos < ActiveRecord::Migration[5.2]
  def change
  	add_column :auctions, :provincia, :string
  	add_column :auctions, :localidad, :string
	add_column :auctions, :pais, :string
  end
end
