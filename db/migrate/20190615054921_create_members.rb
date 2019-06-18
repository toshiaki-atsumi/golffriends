class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name
      t.date :birthdate
      t.string :gender
      t.string :email
      t.string :email1
      t.string :tel
      t.string :tel1
      t.string :password_digest

      t.timestamps
    end
  end
end
