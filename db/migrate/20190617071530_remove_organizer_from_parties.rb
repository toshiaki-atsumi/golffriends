class RemoveOrganizerFromParties < ActiveRecord::Migration[5.2]
  def change
    remove_column :parties, :organizer, :string
  end
end
