class Auctionscampos < ActiveRecord::Migration[5.2]
  def change
  	add_column :residences, :provincia, :string
  	add_column :residences, :localidad, :string
	add_column :residences, :pais, :string
  end
end
