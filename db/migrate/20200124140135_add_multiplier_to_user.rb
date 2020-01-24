class AddMultiplierToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :multiplier, :integer, default: 1, nil: false
  end
end
