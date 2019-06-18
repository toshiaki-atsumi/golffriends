class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties do |t|
      t.string :name
      t.string :content
      t.string :president
      t.string :organizer
      t.references :schedule
      t.references :golfcourse

      t.timestamps
    end
  end
end
