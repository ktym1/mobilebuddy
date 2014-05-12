class AddAddContractIdToSummaries < ActiveRecord::Migration
  def change
    add_column :summaries, :contract_id, :integer
  end
end
