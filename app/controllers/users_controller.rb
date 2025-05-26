class UsersController < ApplicationController
  skip_before_action(:authenticate_user!, { :only => [:index] })

  def index
    @list_of_users = User.all
  end

  def show
  end
end
