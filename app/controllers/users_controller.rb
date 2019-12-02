class UsersController < ApplicationController
  def show; end

  def index
    @factory = User.order(xp: :desc)
  end
end
