class AddActiveToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :active, :boolean, :default => false
  end
end
