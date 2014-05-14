class CreateMetadata < ActiveRecord::Migration
  def change
    create_table :metadata do |t|
      t.text :detail
      t.integer :device_id
      t.integer :retailer_id
      t.timestamps
    end
  end
end
