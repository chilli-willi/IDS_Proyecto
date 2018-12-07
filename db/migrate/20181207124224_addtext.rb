class Addtext < ActiveRecord::Migration[5.2]
  def change
  	add_column :reservations, :weekdate, :text
  end
end
