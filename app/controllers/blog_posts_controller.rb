class BlogPostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @blog_posts = BlogPost.all.order(created_at: :desc)
  end

  def show
    if BlogPost.find(params[:id]).delete_flag == true
      redirect_to '/404.html'
    else
      @blog_post = BlogPost.find(params[:id])
      @blog_post.update(views: @blog_post.views+1)
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to '/404.html'
  end

  def new
    @blog_post = current_user.blog_posts.build
  end

  def create
    @blog_post = current_user.blog_posts.build(blog_post_params)
    if @blog_post.save
      redirect_to @blog_post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @blog_post = BlogPost.find(params[:id])
    if @blog_post.user_id == current_user.id
      @blog_post.destroy
      redirect_to root_path, status: :see_other
    else
      redirect_to '/422.html'
    end
  end

  def edit
    @blog_post = BlogPost.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to '/404.html'
  end

  def update
    @blog_post = BlogPost.find(params[:id])
    if @blog_post.user_id == current_user.id
      @blog_post.update(blog_post_params)
      redirect_to root_path, status: :see_other
    else
      redirect_to '/422.html'
    end
  end

  def archive
    @blog_post = BlogPost.find(params[:id])
    if @blog_post.user_id == current_user.id
      @blog_post.update(:delete_flag=> 1)
      redirect_to root_path, status: :see_other
    else 
      redirect_to '/422.html'
    end
  end

  def unarchive
    @blog_post = BlogPost.find(params[:id])
    @blog_post.update(:delete_flag=> 0)
    redirect_to root_path, status: :see_other
  end

  private
  def blog_post_params
    params.require(:blog_post).permit(:title, :body, :thumbnail, :user_id)
  end


end