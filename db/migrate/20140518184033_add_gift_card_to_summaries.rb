class AddGiftCardToSummaries < ActiveRecord::Migration
  def change
    add_column :summaries, :gift_card, :string
  end
end
