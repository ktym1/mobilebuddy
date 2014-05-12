class AddAddRetailerIdToSummaries < ActiveRecord::Migration
  def change
    add_column :summaries, :retailer_id, :integer
  end
end
