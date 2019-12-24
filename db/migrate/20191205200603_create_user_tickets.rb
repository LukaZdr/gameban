class CreateUserTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :user_tickets do |t|
      t.references :user, foreign_key: true
      t.references :ticket, foreign_key: true
    end
  end
end
