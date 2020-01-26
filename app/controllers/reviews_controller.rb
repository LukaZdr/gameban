class ReviewsController < ApplicationController
  def create
    ticket = Ticket.find(params[:ticket_id])

    review = Review.first_or_initialize(ticket_id: ticket.id)

    if review.save
      current_user.gain_xp(10)
      ticket.next_status
      fast_travel_achievement = Achievement.where(user_id: ticket.user.id, name: 'Fast travel').first
      unless fast_travel_achievement.completed?
        fast_travel_achievement.add_point
        flash[:notice] = 'Achievement unlocked! Check your Profile aaaa' if fast_travel_achievement.completed?
      end
      gotta_go_fast_achievement = Achievement.where(user_id: current_user.id, name: 'Gotta go fast').first
      unless gotta_go_fast_achievement.completed?
        gotta_go_fast_achievement.add_point
        flash[:notice] = 'Achievement unlocked! Check your Profile' if gotta_go_fast_achievement.completed?
      end
    else
      flash[:alert] = 'Review could not be created'
    end
    redirect_to project_path(params[:project_id])
  end

  private

  def review_params
    params.require(:review).permit(:text,
                                   :quality_1,
                                   :quality_2,
                                   :quality_3,
                                   :quality_4,
                                   :quality_5)
  end
end