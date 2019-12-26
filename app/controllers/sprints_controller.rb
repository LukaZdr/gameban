class SprintsController < ApplicationController
  def new
    @project = Project.find(params[:project_id])
    @sprint = @project.sprints.build
  end

  def create
    Sprint.create(sprint_params)
    redirect_to root_path
  end

  private

  def sprint_params
    params.require(:sprint).permit(:project_id, :start_time, :end_time, :qualeties)
  end
end
