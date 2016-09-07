class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.date :initial_date
      t.date :final_date
      t.date :payday
      t.string :description
      t.integer :week_number

      t.timestamps null: false
    end
  end
end
