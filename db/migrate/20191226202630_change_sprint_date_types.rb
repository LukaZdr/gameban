class ChangeSprintDateTypes < ActiveRecord::Migration[6.0]
  def change
    change_table :sprints do |t|
      t.change :start_time, :date
      t.change :end_time, :date
    end
  end
end
