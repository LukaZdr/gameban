class ReviewsController < ApplicationController
  def create
    ticket = Ticket.find(params[:ticket_id])
    review = ticket.build_review(review_params)

    if review.save
      ticket.next_status(current_user)
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