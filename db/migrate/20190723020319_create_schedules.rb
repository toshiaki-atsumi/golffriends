class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.references :party, foreign_key: true
      t.string :mark1, :limit =>5
      t.string :mark2, :limit =>5
      t.string :mark3, :limit =>5      
      t.string :mark4, :limit =>5      
      t.string :mark5, :limit =>5      
      t.string :mark6, :limit =>5        
      t.string :comment 
      
      t.timestamps
    end
  end
end
