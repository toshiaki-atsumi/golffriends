class AddDateToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :date, :date
  end
end
