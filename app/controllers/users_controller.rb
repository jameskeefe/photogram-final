class UsersController < ApplicationController
  def index
    @list_of_users = User.all
  end

  def show
  end
end
