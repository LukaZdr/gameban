class AddTendencyToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :tendency, :integer, null: false, default: 0
  end
end
