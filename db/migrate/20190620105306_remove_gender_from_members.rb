class RemoveGenderFromMembers < ActiveRecord::Migration[5.2]
  def change
    remove_column :members, :gender, :string
  end
end
