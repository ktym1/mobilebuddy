class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|

      t.timestamps
      t.string :name
      t.string :description
      t.string :model
    end
  end
end
