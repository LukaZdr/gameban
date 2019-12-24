class DropProjectTicketsTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :project_tickets
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
