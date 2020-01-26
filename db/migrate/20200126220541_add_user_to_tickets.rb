class AddUserToTickets < ActiveRecord::Migration[6.0]
  def change
    change_table :tickets do |t|
      t.references :user
    end
  end
end
