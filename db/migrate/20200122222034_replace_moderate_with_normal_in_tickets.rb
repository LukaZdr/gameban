class ReplaceModerateWithNormalInTickets < ActiveRecord::Migration[6.0]

  def change
    Ticket.where(priority: 'Moderate').update_all(priority: 'Normal')

    change_column_default(:tickets, :priority, 'Normal')
  end
end
