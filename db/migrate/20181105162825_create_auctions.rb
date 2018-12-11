class CreateAuctions < ActiveRecord::Migration[5.2]
  def change
    create_table :auctions do |t|
      t.string :name
      t.string :des
      t.integer :monto
      t.integer :minimapuja
      t.integer :user_id
      t.timestamps
    end
  end
end
