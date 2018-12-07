class Addcreditss < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :creditos, :integer, default: 2
  end
end
