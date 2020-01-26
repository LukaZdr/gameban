class TicketsController < ApplicationController
  def create
    @sprint = Sprint.find(params[:sprint_id])
    ticket = @sprint.tickets.build(ticket_params)
    if ticket.save
      extra_fuel_achievement = Achievement.where(user_id: current_user.id, name: 'Extra fuel').first
      add_point_to_achievement(extra_fuel_achievement)
      flash[:notice] = 'Achievement unlocked! Check your Profile' if extra_fuel_achievement.completed?
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
    ticket.next_status(current_user)
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

  def add_point_to_achievement(achievement)
    if achievement.goal > achievement.points
      achievement.points += 1
    end
    achievement.save
  end
end
