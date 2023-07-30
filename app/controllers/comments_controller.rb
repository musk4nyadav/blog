class CommentsController < ApplicationController
  def new
    @blog_post = BlogPost.find(params[:blog_post_id])
    @comment = @blog_post.comments.new(comment_id: params[:comment_id])
  end
  def create
    @blog_post = BlogPost.find(params[:blog_post_id])
    @comment = @blog_post.comments.create(comment_params)
    redirect_to blog_post_path(@blog_post)
  end

  def destroy
    @blog_post = BlogPost.find(params[:blog_post_id])
    @comment = @blog_post.comments.find(params[:id])
    @comment.destroy
    redirect_to blog_post(@blog_post)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body, :comment_id)
    end

end
