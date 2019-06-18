class AddPasswordDigestToParties < ActiveRecord::Migration[5.2]
  def change
    add_column :parties, :password_digest, :string
  end
end
