class UsersController < ApplicationController
  skip_before_action(:authenticate_user!, { :only => [:index] })

  def index
    @list_of_users = User.all
  end

  def show
    @the_username = params.fetch("path_id")

    @the_user = User.where({ :username => @the_username }).at(0)

    render({ :template => "users/show" })
  end
end
