class Def1 < ActiveRecord::Migration[5.2]
  def change
  	change_column :users, :premium, :integer, default: 2
  end
end
