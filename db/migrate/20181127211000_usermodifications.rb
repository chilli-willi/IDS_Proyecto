class Usermodifications < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :age, :date
  	add_column :users, :card, :integer
  	add_column :users, :cvv, :integer
  	add_column :users, :exp, :date
  end
end
