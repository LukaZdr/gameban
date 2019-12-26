class SprintsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @sprint = @project.sprints.build
  end

  def create
    @project = Project.find(params[:project_id])
    @sprint = @project.sprints.build(sprint_params)
    if @sprint.save
      flash[:notice] = 'Sprint whas been created'
      redirect_to project_sprints_path
    else
      flash[:alert] = 'Sprint could not be created'
      render 'new'
    end
  end

  def index
    @project = Project.find(params[:project_id])
    @sprints = Sprint.where(project_id: params[:project_id])
  end

  def edit
    @project = Project.find(params[:project_id])
    @sprint = @project.sprints.build
  end

  def update
    @project = Project.find(params[:project_id])
    @sprint = @project.sprints.build(sprint_params)
    if @sprint.save
      flash[:notice] = 'Sprint whas been updated'
      redirect_to project_sprints_path
    else
      flash[:alert] = 'Sprint could not be updated'
      render 'edit'
    end
  end

  private

  def sprint_params
    params.require(:sprint).permit(:project_id, :start_time, :end_time, :qualeties)
  end
end
