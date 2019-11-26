class UserStartValuesForLevelAndXp < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :level, :bigint, :default => 0
    change_column :users, :xp, :bigint, :default => 0
  end
end
