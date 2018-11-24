class Def < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :premium, :integer, default: 0
  end
end
