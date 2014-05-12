class AddAddDeviceIdToSummaries < ActiveRecord::Migration
  def change
    add_column :summaries, :device_id, :integer
  end
end
