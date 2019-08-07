class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.references :schedule, foreign_key: true
      t.references :member, foreign_key: true
      t.string :mark ,limit:5
      t.string :comment

      t.timestamps
    end
  end
end
