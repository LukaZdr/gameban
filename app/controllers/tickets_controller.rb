class TicketsController < ApplicationController
  def create
    @sprint = Sprint.find(params[:sprint_id])
    ticket = @sprint.tickets.build(ticket_params)
    if ticket.save
      redirect_to project_path(params[:project_id])
    else
      flash[:alert] = 'Ticket could not be created'
      redirect_to project_path(params[:project_id])
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:name,
                                   :description,
                                   :hours_of_work,
                                   :priority,
                                   :status)
  end
end
