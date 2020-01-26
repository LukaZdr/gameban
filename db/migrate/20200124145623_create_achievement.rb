class CreateAchievement < ActiveRecord::Migration[6.0]
  def change
    create_table :achievements do |t|
      t.string :name, nil: false
      t.string :decription, nil: false
      t.integer :points, default: 0
      t.integer :goal, nil: false
    end
  end
end
