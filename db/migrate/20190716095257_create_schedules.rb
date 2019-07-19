class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.references :party, foreign_key: true
      t.datetime :date
      t.string :event1
      t.string :event2
      t.string :event3
      t.string :event4
      t.string :event5
      t.string :comment

      t.timestamps
    end
  end
end
