class AchievementsController < ApplicationController
  def redeem_extra_fuel
    current_user.gain_xp(45)
    achievement = Achievement.where(user_id: current_user.id, name: 'Extra fuel').first
    achievement.redeem
    redirect_to user_path(current_user)
  end

  def redeem_fast_travel
    current_user.gain_xp(25)
    achievement = Achievement.where(user_id: current_user.id, name: 'Fast travel').first
    achievement.redeem
    redirect_to user_path(current_user)
  end

  def redeem_gotta_go_fast
    current_user.multiplier = 2
    current_user.save
    achievement = Achievement.where(user_id: current_user.id, name: 'Gotta go fast').first
    achievement.redeem
    redirect_to user_path(current_user)
  end
end
