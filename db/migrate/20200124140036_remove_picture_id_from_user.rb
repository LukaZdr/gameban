class RemovePictureIdFromUser < ActiveRecord::Migration[6.0]
  def change

    remove_column :users, :picture_id, :integer
  end
end
