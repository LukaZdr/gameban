class AddUserReferenceToAchievements < ActiveRecord::Migration[6.0]
  def change
    add_reference :achievements, :user, index: true
  end
end
