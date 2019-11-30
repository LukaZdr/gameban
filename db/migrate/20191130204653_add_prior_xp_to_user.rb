class AddPriorXpToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :prior_xp, :integer, default: 0
  end
end
