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

  def update
    ticket = Ticket.find(params[:id])
    if ticket.update(ticket_params)
      redirect_to project_path(params[:project_id])
    else
      flash[:alert] = 'Ticket could not be updated'
      redirect_to project_path(params[:project_id])
    end
  end

  def next
    ticket = Ticket.find(params[:ticket_id])
    ticket.next_status
    redirect_to project_path(ticket.sprint.project)
  end

  def previous
    ticket = Ticket.find(params[:ticket_id])
    ticket.previous_status
    redirect_to project_path(ticket.sprint.project)
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
