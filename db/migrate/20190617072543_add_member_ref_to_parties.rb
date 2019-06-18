class AddMemberRefToParties < ActiveRecord::Migration[5.2]
  def change
    add_reference :parties, :member, foreign_key: true
  end
end
