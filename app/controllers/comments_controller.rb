class CommentsController < ApplicationController
  def new
    if user_signed_in?
      @blog_post = BlogPost.find(params[:blog_post_id])
      @comment = @blog_post.comments.new(comment_id: params[:comment_id])
    else 
      redirect_to new_user_session_path
    end
  end
  def create
    if user_signed_in?
      @blog_post = BlogPost.find(params[:blog_post_id])
      @comment = @blog_post.comments.create(comment_params)
      if @comment.save
        redirect_to blog_post_path(@blog_post)
      else 
        redirect_to "/new", notice: "You comment body was empty"
      end
    else 
      redirect_to new_user_session_path
    end
  end

  def destroy
    if user_signed_in?
      @blog_post = BlogPost.find(params[:blog_post_id])
      @comment = @blog_post.comments.find(params[:id])
      if @comment.commenter == current_user.email
        @comment.destroy
        redirect_to blog_post_path(@blog_post)
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :comment_id)
    end

end
