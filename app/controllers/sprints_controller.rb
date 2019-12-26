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
    @sprint = Sprint.find(params[:id])
  end

  def update
    print(params)
    @sprint = Sprint
    start_time = Date.parse([params[:sprint]["start_time(1i)"], params[:sprint]["start_time(2i)"], params[:sprint]["start_time(3i)"]].join("-"))
    params[:sprint][:start_time] = start_time
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
