class RemoveTendencyFromUser < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :tendency, :integer
  end
end
