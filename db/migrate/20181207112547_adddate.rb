class Adddate < ActiveRecord::Migration[5.2]
  def change
  		add_column :reservations, :modo, :integer, default: 0
  end
end
