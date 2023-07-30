class BlogPostsController < ApplicationController
  def index
    @blog_posts = BlogPost.all
  end

  def show
    if BlogPost.find(params[:id]).delete_flag == true
      redirect_to '/404.html'
    else
      @blog_post = BlogPost.find(params[:id])
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to '/404.html'
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    if @blog_post.save
      redirect_to @blog_post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @blog_post = BlogPost.find(params[:id])
    @blog_post.destroy
    redirect_to root_path, status: :see_other
  end

  def edit
    @blog_post = BlogPost.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to '/404.html'
  end

  def update
    @blog_post = BlogPost.find(params[:id])
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def archive
    @blog_post = BlogPost.find(params[:id])
    @blog_post.update(:delete_flag=> 1)
    redirect_to root_path, status: :see_other
  end

  def unarchive
    @blog_post = BlogPost.find(params[:id])
    @blog_post.update(:delete_flag=> 0)
    redirect_to root_path, status: :see_other
  end

  private
  def blog_post_params
    params.require(:blog_post).permit(:title, :body, :thumbnail)
  end

end