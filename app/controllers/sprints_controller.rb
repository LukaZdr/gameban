class SprintsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @sprint = @project.sprints.build
  end

  def create
    @project = Project.find(params[:project_id])
    @sprint = @project.sprints.build(sprint_params)
    if @sprint.save
      flash[:success] = 'Sprint has been created'
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
    @sprint = Sprint.find(params[:id])
  end

  def update
    @sprint = Sprint.find(params[:id])
    @project = Project.find(@sprint.project_id)
    if @sprint.update(sprint_params)
      flash[:success] = 'Sprint has been updated'
      redirect_to project_sprints_path(@project.id)
    else
      flash.now[:error] = 'Sprint could not be updated'
      render 'edit'
    end
  end

  private

  def sprint_params
    params.require(:sprint).permit(:project_id,
                                   :start_time,
                                   :length,
                                   :quality_1,
                                   :quality_2,
                                   :quality_3,
                                   :quality_4,
                                   :quality_5,)
  end
end
