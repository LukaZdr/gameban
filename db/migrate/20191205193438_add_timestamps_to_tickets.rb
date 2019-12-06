class AddTimestampsToTickets < ActiveRecord::Migration[6.0]
  def change
    change_table :tickets do |t|
      t.timestamps
    end
  end
end
