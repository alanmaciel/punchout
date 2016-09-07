class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.time :work_starts_at
      t.time :work_ends_at
      t.time :arrival_tolerance

      t.timestamps null: false
    end
  end
end
