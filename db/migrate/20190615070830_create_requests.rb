class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.references :member, foreign_key: true
      t.references :party, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
