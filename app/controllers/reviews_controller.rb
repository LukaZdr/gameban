class ReviewsController < ApplicationController
  def create
    ticket = Ticket.find(params[:ticket_id])

    review = Review.first_or_initialize(ticket_id: ticket.id)

    if review.save
      current_user.gain_xp(10)
      ticket.next_status
      fast_travel_achievement = Achievement.where(user_id: ticket.user.id, name: 'Fast travel').first
      fast_travel_achievement.add_point
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