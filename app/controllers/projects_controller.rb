class ProjectsController < ApplicationController
  def show; end

  def index
    @projects = current_user.projects
  end
end
