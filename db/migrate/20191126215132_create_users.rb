class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.bigint :level
      t.bigint :xp
      t.integer :picture_id
    end
  end
end
