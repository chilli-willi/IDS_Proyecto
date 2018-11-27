class AddPremiumMaxbidToAuctions < ActiveRecord::Migration[5.2]
  def change
    add_column :auctions, :maxbid, :integer
  end
end
