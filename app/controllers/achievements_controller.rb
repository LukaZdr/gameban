class AchievementsController < ApplicationController
  def redeem_extra_fuel
    current_user.gain_xp(45)
    achievement = Achievement.where(user_id: current_user.id, name: 'Extra fuel').first
    achievement.redeem
    redirect_to user_path(current_user)
  end
end
