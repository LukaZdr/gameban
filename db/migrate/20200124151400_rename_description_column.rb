class RenameDescriptionColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :achievements, :decription, :description
  end
end
