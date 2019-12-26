class SplitSprintQualities < ActiveRecord::Migration[6.0]
  def change
    change_table :sprints do |t|
      t.remove :qualeties
      t.string :quality_1
      t.string :quality_2
      t.string :quality_3
      t.string :quality_4
      t.string :quality_5
    end
  end
end