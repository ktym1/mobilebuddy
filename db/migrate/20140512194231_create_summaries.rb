class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.decimal :price
      t.string :promotion_link

      t.timestamps
    end
  end
end
