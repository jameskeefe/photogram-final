class CommentsController < ApplicationController
  def index
    matching_comments = Comment.all

    @list_of_comments = matching_comments.order({ :created_at => :desc })

    render({ :template => "comments/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_comments = Comment.where({ :id => the_id })

    @the_comment = matching_comments.at(0)

    render({ :template => "comments/show" })
  end

  def create
    the_comment = Comment.new
    the_comment.author_id = params.fetch("query_author_id")
    the_comment.body = params.fetch("query_body")
    the_comment.photo_id = params.fetch("query_photo_id")

    if the_comment.valid?
      the_comment.save

      # p = Photo.where({:id => params.fetch("query_photo_id")}).at(0)
      # p.comments_count = p.comments_count + 1
      # p.save

      # u = User.where({:id => params.fetch("query_author_id")}).at(0)
      # u.comments_count = u.comments_count + 1
      # u.save
      
      redirect_to("/photos/#{the_comment.photo_id}", { :notice => "Comment created successfully." })
    else
      redirect_to("/photos/#{the_comment.photo_id}", { :alert => the_comment.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_comment = Comment.where({ :id => the_id }).at(0)
    user_id = the_comment.author_id
    photo_id = the_comment.photo_id

    the_comment.destroy

    # p = Photo.where({:id => photo_id}).at(0)
    # p.comments_count = p.comments_count - 1
    # p.save

    # u = User.where({:id => user_id}).at(0)
    # u.comments_count = u.comments_count - 1
    # u.save

    redirect_to("/photos/#{photo_id}", { :notice => "Comment deleted successfully."} )
  end
end
