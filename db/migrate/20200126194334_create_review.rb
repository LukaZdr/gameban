class CreateReview < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :text
      t.integer :quality_1
      t.integer :quality_2
      t.integer :quality_3
      t.integer :quality_4
      t.integer :quality_5
      t.references :ticket
    end
  end
end
