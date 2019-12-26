class CreateSprints < ActiveRecord::Migration[6.0]
  def change
    create_table :sprints do |t|
      t.references :project, foreign_key: true
      t.datetime :start_time, nil: false
      t.datetime :end_time, nil: false
      t.string :qualeties, array: true
      t.timestamps
    end
  end
end
