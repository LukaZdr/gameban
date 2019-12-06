class CreateProjectTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :project_tickets do |t|
      t.references :project, foreign_key: true
      t.references :ticket, foreign_key: true
    end
  end
end
