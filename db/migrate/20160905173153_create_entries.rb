class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :barcode
      t.datetime :arrival_at
      t.datetime :departure_at

      t.timestamps null: false
    end
  end
end
