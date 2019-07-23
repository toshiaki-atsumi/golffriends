class RemoveMark1FromSchedules < ActiveRecord::Migration[5.2]
  def change
    remove_column :schedules, :mark1, :string
    remove_column :schedules, :mark2, :string
    remove_column :schedules, :mark3, :string
    remove_column :schedules, :mark4, :string
    remove_column :schedules, :mark5, :string
    remove_column :schedules, :mark6, :string    
  end
end
