class AddSprintToTicket < ActiveRecord::Migration[6.0]
  def change
    add_reference :tickets, :sprint
  end
end
