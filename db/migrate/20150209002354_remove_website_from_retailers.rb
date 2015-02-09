class RemoveWebsiteFromRetailers < ActiveRecord::Migration
  def change
    remove_column :retailers, :website
  end
end
