class ProjectsController < ApplicationController
  def show; end

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @sprint = Sprint.last
  end
end
