class ChangeEndTimeToLength < ActiveRecord::Migration[6.0]
  def change
    change_table :sprints do |t|
      t.remove :end_time
      t.integer :length, nil: false
    end
  end
end
