class AddsPropertiesToTickets < ActiveRecord::Migration[6.0]
  def change
    change_table :tickets do |t|
      t.integer :hours_of_work, nil: false
      t.string :priority, default: 'Moderate'
      t.string :status, default: 'Backlog'
    end
  end
end
