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

  def photo_stream
    @the_username = params.fetch("path_id")
    stream_type = params.fetch("stream_type")

    @the_user = User.where({ :username => @the_username }).at(0)

    if stream_type == "liked_photos"
      @t = "Liked photos"
      @photo_stream = @the_user.liked_photos
    elsif stream_type == "feed"
      @t = "Feed"
      @photo_stream = @the_user.feed    
    elsif stream_type == "discover"
      @t = "Discover"
      @photo_stream = @the_user.discover    
    else
      @t = "Own photos"
      @photo_stream = @the_user.own_photos
    end

    render({ :template => "users/streams" })
  end

end
